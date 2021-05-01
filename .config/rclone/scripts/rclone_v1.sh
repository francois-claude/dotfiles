#!/bin/bash

## RCLONE BACKUP SCRIPT

## RCLONE HOST IP ADDR
BIND_ADDR="10.10.120.13"

## PATHS (TO DO: REMOVE TRAILING SLASHES AUTOMATIC)
SOURCE_NFS="/mnt/nfs"
SOURCE_SMB="/mnt/smb"
SOURCE_VOL="/mnt/vol"
DEST_REMOTE="gcrypt:/"
LOG_PATH="/home/rclone/rclone_logs"
WORKING_DIR="$(pwd)"

## RCLONE CONFIGURATION
CONFIG_FILE="/home/rclone/.config/rclone/rclone.conf"
EXCLUDE_FILE="/home/rclone/.config/rclone/excludes.list"

## LOGS
TIMESTAMP=$(date +"%m-%d-%y")
LOG_LEVEL="INFO"

## DEFINE ARRAYS
NFS_ALL=("docs" "french" "movies" "pr0n" "tv" "uhd" "uhd_docs" "common" "iso" "snapshots" "templates" "backups") #books #music #discs
#SMB_ALL=("scanner-share")

## GDRIVE CONFIGURATION
BW_LIMIT="8192k"
MINIMUM_AGE="24h"
NUM_TRANSFERS="4"
NUM_CHECKERS="8"
TPS_LIMIT="10"
TPS_BURST="10"
GDRIVE_CLIENT_ID=""
UPLOAD_CUTOFF="8M"
CHUNK_SIZE="8M"
BUFFER_SIZE="16M"

## DO NOT EDIT BELOW THIS LINE

check_log_dir()
{
      LOG_FILE="$LOG_PATH/$1.log"

      ## CHECK IF LOG DIRECTORY EXISTS
      if [[ ! -d "$LOG_PATH" ]]
      then
            mkdir -p "$LOG_PATH"
      fi

      ## CHECK IF LOG FILE EXISTS
      if [[ ! -f "$LOG_FILE" ]]
      then
            touch "$LOG_FILE"
      fi
}

check_mount()
{
      ## DEFINE LOCAL VARIABLES
      SOURCE_DIR="$1"
      MOUNT_TYPE="$2"
      FAIL_COUNT="$3"

      # CHECK IF SOURCE DIRECTORY IS MOUNTED
      if [[ $(/usr/bin/findmnt --output TARGET,FSTYPE "$SOURCE_DIR" | grep "$MOUNT_TYPE") ]]
      then
            true
            return
      else
            if [[ $FAIL_COUNT -le "3" ]]
            then
                  ((FAIL_COUNT++))
                  ## CD INTO DIRECTORY TO ACTIVATE SYSTEMD AUTOMOUNTS
                  cd "$SOURCE_DIR" > /dev/null 2>&1
                  cd "$WORKING_DIR" > /dev/null 2>&1

                  ## RE-EXECUTE CHECK_MOUNT FUNCTION
                  check_mount "$SOURCE_DIR" "$MOUNT_TYPE" "$FAIL_COUNT"

            else
                  false
                  return
            fi
      fi
}

## RCLONE FUNCTION
run_rclone ()
{
      ## DEFINE LOCAL VARIABLES
      SOURCE_DIR="$1"
      DEST_DIR="$2"
      BACKUP_NAME="$3"

      # RUN RCLONE
      /usr/bin/rclone copy \
            --checksum \
            --bind "$BIND_ADDR" \
            --bwlimit "$BW_LIMIT" \
            --min-age "$MINIMUM_AGE" \
            --transfers "$NUM_TRANSFERS" \
            --checkers "$NUM_CHECKERS" \
            --tpslimit "$TPS_LIMIT" \
            --tpslimit-burst "$TPS_BURST" \
            --drive-client-id "$GDRIVE_CLIENT_ID" \
            --fast-list \
            --drive-upload-cutoff "$UPLOAD_CUTOFF" \
            --drive-chunk-size "$CHUNK_SIZE" \
            --buffer-size "$BUFFER_SIZE" \
            --copy-links \
            --delete-excluded \
            --exclude-from "$EXCLUDE_FILE" \
            --config "$CONFIG_FILE" \
            --log-file "$LOG_PATH/$BACKUP_NAME.log" \
            --log-level "$LOG_LEVEL" \
            --suffix="$TIME_STAMP" \
      "$SOURCE_DIR" "$DEST_DIR"
}


backups_nfs()
{
      ## RUN NFS MEDIA
      for i in "${NFS_ALL[@]}"
      do
            ## DEFINE LOCAL VARIABLES
            SOURCE_DIR="$SOURCE_NFS/$i"
            DEST_DIR="$DEST_REMOTE/$i"
            MOUNT_TYPE="nfs4"

            ## CHECK LOGS
            check_log_dir "$i"

            ## CHECK MOUNTS && RUN RCLONE
            if check_mount "$SOURCE_DIR" "$MOUNT_TYPE" "0"
            then
                  run_rclone "$SOURCE_DIR" "$DEST_DIR" "$i"
            fi
      done
}

backups_nfs

      # /usr/bin/rclone copy \
      # --checksum \                               ## Skip based on checksum (if available) & size, not mod-time & size
      # --bind "$BIND_ADDR" \                      ## Local address to bind to for outgoing connections, IPv4, IPv6 or name.
      # --bwlimit "$BW_LIMIT" \                    ## Bandwidth limit in kBytes/s, or use suffix b|k|M|G or a full timetable
      # --min-age "$MINIMUM_AGE" \                 ## Only transfer files older than this in s or suffix ms|s|m|h|d|w|M|y (default off)
      # --transfers "$NUM_TRANSFERS" \             ## Number of file transfers to run in parallel. (default 4)
      # --checkers "$NUM_CHECKERS" \               ## Number of checkers to run in parallel. (default 8)
      # --check-first \                            ## Do all the checks before starting transfers.
      # --tpslimit "$TPS_LIMIT" \                  ## Limit HTTP transactions per second to this.
      # --tpslimit-burst "$TPS_BURST" \            ## Max burst of transactions for --tpslimit. (default 1)
      # --drive-client-id "$GDRIVE_CLIENT_ID" \    ## Google Application Client Id
      # --fast-list \                              ## Use recursive list if available. Uses more memory but fewer transactions.
      # --drive-stop-on-download-limit \           ## Make download limit errors be fatal
      # --drive-stop-on-upload-limit \             ## Make upload limit errors be fatal
      # --drive-upload-cutoff "$UPLOAD_CUTOFF" \   ## Cutoff for switching to chunked upload (default 8M)
      # --drive-chunk-size "$CHUNK_SIZE" \         ## Upload chunk size. Must a power of 2 >= 256k. (default 8M)
      # --buffer-size "$BUFFER_SIZE" \             ## In memory buffer size when reading files for each --transfer. (default 16M)
      # --copy-links \                             ## Follow symlinks and copy the pointed to item.
      # --delete-excluded \                        ## Delete files on dest excluded
      # --exclude-from "$EXCLUDE_FILE" \           ## Read exclude patterns from file (use - to read from stdin)
      # --config "$CONFIG_FILE" \                  ## Config file. (default "/home/fclaude/.config/rclone/rclone.conf")
      # --log-file "$LOG_PATH/$BACKUP_NAME.log" \            ## Log everything to this file
      # --log-level "$LOG_LEVEL" \                 ## Log level DEBUG|INFO|NOTICE|ERROR (default "NOTICE")
      # --suffix="$TIME_STAMP" \                   ## Suffix to add to changed files.
      # "$SOURCE_DIR" "$DEST_DIR"
