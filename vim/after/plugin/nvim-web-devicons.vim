if &runtimepath =~ 'nvim-web-devicons'
lua <<EOF
require'nvim-web-devicons'.setup {
 default = true;
}
EOF
endif
