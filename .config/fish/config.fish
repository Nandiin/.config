alias l "ls -al"
set -l user_python (python -c "import site; print(site.getuserbase())")
set -U fish_user_paths "$user_python/bin" $fish_user_paths
