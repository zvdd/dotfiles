[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# >>> JVM installed by coursier >>>
export JAVA_HOME="/Users/vesselx/Library/Caches/Coursier/jvm/adopt@1.8.0-292/Contents/Home"
# <<< JVM installed by coursier <<<

# >>> coursier install directory >>>
export PATH="$PATH:/Users/vesselx/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<
export GPG_TTY=$(tty)
. "$HOME/.cargo/env"
