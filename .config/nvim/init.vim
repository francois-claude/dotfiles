

execute pathogen#infect()
filetype plugin indent on
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:shfmt_opt="-ci"
let g:neoformat_run_all_formatters = 1

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

let g:indent_guides_enable_on_vim_startup = 1
let g:indentLine_enabled = 1


let g:neoformat_c_clangformat = {
	\ 'exe': 'clang-format',
	\ 'args': ['--style="{BasedOnStyle: LLVM, IndentWidth: 8, UseTab: Always, BreakBeforeBraces: Linux, AllowShortIfStatementsOnASingleLine: false, IndentCaseLabels: false, AllowShortBlocksOnASingleLine: Never }"'],
	\ }

let g:neoformat_cpp_clangformat = {
    	\ 'exe': 'clang-format',
	\ 'args': ['--style="{BasedOnStyle: Google, IndentWidth: 4, AlignConsecutiveAssignments: true, AlignEscapedNewlines: true, AlignTrailingComments: true, SpacesBeforeTrailingComments: 5, SpacesInLineCommentPrefix: {Minimum: 1, Maximum: 1}, SpacesInParentheses: true, SpacesInSquareBrackets: true, SortIncludes: CaseSensitive, SortUsingDeclarations: true, ColumnLimit: 100, AllowShortBlocksOnASingleLine: Never, AllowShortFunctionsOnASingleLine: Empty, AllowShortCaseLabelsOnASingleLine: false, AllowShortIfStatementsOnASingleLine: Never}"']
    	\}

let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

colorscheme dracula
