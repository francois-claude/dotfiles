#!/bin/sh

WSNUM='1'
WSNAME='Secondary'

# ----------------------

sanitize_input() {
   local s="${1?need a string}"   # receive input in first argument
   s="${s//[^[:alnum:]]/-}"       # replace all non-alnum characters to -
   s="${s//+(-)/-}"               # convert multiple - to single -
   s="${s/#-}"                    # remove - from start
   s="${s/%-}"                    # remove - from end
   VARSANITIZED="${s,,}"          # convert to lowercase
}

set_layout() {
    local WSLAYOUT="/home/fclaude/.config/i3/workspaces/workspace_$1_$2.json"
    local WSTITLE="$1:${2^}"

    if [ -f "$WSLAYOUT" ]; then
        /usr/bin/i3-msg "workspace $WSTITLE; append_layout $WSLAYOUT"
        /usr/bin/sleep 0.5
    fi
}

# sanitize num
sanitize_input "$WSNUM" && WSNUM=$VARSANITIZED

# sanitize name
sanitize_input "$WSNAME" && WSNAME=$VARSANITIZED

# ----------------------

# set_layout (ws num, ws name)
set_layout "$WSNUM" "$WSNAME"


# launch spotify-tui
/usr/bin/i3-msg "workspace $WSNUM:${WSNAME^}; \

                exec --no-startup-id \
                /usr/bin/gnome-terminal \
                    --title=ws1_spt \
                    --role=ws1_spt \
                    -- spt --config /home/fclaude/.config/spotify-tui/config.yml"

/usr/bin/sleep 0.5


# launch cava
/usr/bin/i3-msg "workspace $WSNUM:${WSNAME^}; \

                exec --no-startup-id \
                /usr/bin/gnome-terminal \
                    --title=ws1_cava \
                    --role=ws1_cava \
                    -- cava"

/usr/bin/sleep 0.5


# launch discord
/usr/bin/i3-msg "workspace $WSNUM:${WSNAME^}; \

                exec --no-startup-id \
                /usr/bin/flatpak run com.discordapp.Discord"

/usr/bin/sleep 2.5


# launch bitwarden
/usr/bin/i3-msg "workspace $WSNUM:${WSNAME^}; \

                exec --no-startup-id \
                /usr/bin/flatpak run com.bitwarden.desktop"

/usr/bin/sleep 0.5


# launch zenmonitor
/usr/bin/i3-msg "workspace $WSNUM:${WSNAME^}; \

                exec --no-startup-id \
                /usr/bin/zenmonitor \
                    --class=zenClass"

/usr/bin/sleep 0.5


# launch telegram
/usr/bin/i3-msg "workspace $WSNUM:${WSNAME^}; \

                exec --no-startup-id \
                /usr/bin/flatpak run org.telegram.desktop"

/usr/bin/sleep 0.5


# launch signal-desktop
/usr/bin/i3-msg "workspace $WSNUM:${WSNAME^}; \

                exec --no-startup-id \
                /usr/bin/flatpak run org.signal.Signal"

/usr/bin/sleep 0.5
