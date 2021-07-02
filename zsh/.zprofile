eval "$(/opt/homebrew/bin/brew shellenv)"

# >>> JVM installed by coursier >>>
export JAVA_HOME="/Users/vesselx/Library/Caches/Coursier/jvm/adopt@1.8.0-292/Contents/Home"
# <<< JVM installed by coursier <<<

# >>> coursier install directory >>>
export PATH="$PATH:/Users/vesselx/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<
export GPG_TTY=$(tty)

# brew
#  export PATH=$PATH:/usr/local/bin # brew
# set SDKroot 
export SDKROOT=$(xcrun --show-sdk-path)

# pyenv 
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
