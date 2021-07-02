
# >>> JVM installed by coursier >>>
export JAVA_HOME="/Users/vesselx/Library/Caches/Coursier/jvm/adopt@1.8.0-292/Contents/Home"
# <<< JVM installed by coursier <<<

# >>> coursier install directory >>>
export PATH="$PATH:/Users/vesselx/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<
. "$HOME/.cargo/env"
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
