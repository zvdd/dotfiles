    # Editor
    # For Terminal
    export EDITOR="${commands[vim]:-$EDITOR}"
    export EDITOR="${commands[nvim]:-$EDITOR}"
    export CVSEDITOR="${EDITOR}"
    export GIT_EDITOR="${EDITOR}"
    # For GUI
    export VISUAL="${EDITOR}"