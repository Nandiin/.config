alias l "ls -al"
set -l user_python (python -c "import site; print(site.getuserbase())")
set -x PATH "$user_python/bin" $PATH
if test -e ~/.local/share/fish/config.fish
	source ~/.local/share/fish/config.fish
end

