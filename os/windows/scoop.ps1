# Install scoop 
# iwr -useb get.scoop.sh | iex
# Set-ExecutionPolicy RemoteSigned -scope CurrentUser

scoop bucket add github-gh https://github.com/cli/scoop-gh.git
scoop install gh

