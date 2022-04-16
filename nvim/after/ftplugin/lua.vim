if executable('luafmt')
  setlocal formatprg=luafmt\ --stdin
  setlocal formatexpr=
endif
