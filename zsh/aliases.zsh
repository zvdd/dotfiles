#!/usr/bin/env zsh

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# copy working directory
alias cwd='pwd | tr -d "\r\n" | xclip -selection clipboard'

# untar
alias untar='tar xvf'

alias md='mkdir -p'
alias rd=rmdir
alias cp="cp -iv"                       
alias mv="mv -iv" 
alias ldir="ls -al | grep ^d"           
alias agall='ag --silent --hidden -g ""'
alias agdot='ag --silent --hidden -g ".[^/]+"'

alias sudo='sudo '
alias usudo='sudo -E -s '

alias dot='\cd ~/dotfiles'
alias tmp='\cd /tmp'

# Edit dotfile in repo
alias vimrc='vim ~/.vimrc'
alias vimplug='vim ~/.vim_plug'
alias vimbase='vim ~/.vim_base'
alias vimmap='vim ~/.vim_map'
alias gvimrc='vim ~/.gvimrc'
alias vimlocal='vim ~/.vim_local'
alias zshrc='vim ~/.zshrc'
alias zshenv='vim ~/.zshenv'
alias zshfzf='vim ~/.zsh_fzf_extra'
alias zshalias='vim ~/.zsh_aliases'
alias zshlocal='vim ~/.zsh_local'
alias zprofile='vim ~/.zprofile'
alias zshcustom='vim ~/.zsh_custom'
# alias zshmisc='vim ~/.zsh_misc'
alias zshfunctions='vim ~/.zshfunctions'
# alias hostinfo='vim ~/.ssh/host_info'
alias tmuxconf='vim ~/.tmux.conf'
# alias ycmconf='vim ~/.ycm_extra_conf.py'
alias emconf='em ~/.spacemacs'
alias karaconf='vim ~/.config/karabiner.edn'

alias -- -="cd -"
alias ..='cd ..'
alias -g ...='../..'
alias cd.='cd ..'
alias cd..='cd ..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias .3="cd ../../../"
alias .4="cd ../../../../"
alias .5="cd ../../../../../"
alias .6="cd ../../../../../../"

alias -g CA="2>&1 | cat -A"
alias -g C='| wc -l'
alias -g D="DISPLAY=:0.0"
alias -g DN=/dev/null
alias -g ED="export DISPLAY=:0.0"
alias -g EG='|& egrep'
alias -g EH='|& head'
alias -g EL='|& less'
alias -g ELS='|& less -S'
alias -g ETL='|& tail -20'
alias -g ET='|& tail'
alias -g F=' | fmt -'
alias -g G='| egrep'
alias -g H='| head'
alias -g HL='|& head -20'
alias -g Sk="*~(*.bz2|*.gz|*.tgz|*.zip|*.z)"
alias -g LL="2>&1 | less"
alias -g L="| less"
alias -g LS='| less -S'
alias -g MM='| most'
alias -g M='| more'
alias -g NE="2> /dev/null"
alias -g NS='| sort -n'
alias -g NUL="> /dev/null 2>&1"
alias -g PIPE='|'
alias -g R=' > /c/aaa/tee.txt '
alias -g RNS='| sort -nr'
alias -g S='| sort'
alias -g TL='| tail -20'
alias -g T='| tail'
alias -g US='| sort -u'
alias -g VM=/var/log/messages
alias -g X0G='| xargs -0 egrep'
alias -g X0='| xargs -0'
alias -g XG='| xargs egrep'
alias -g X='| xargs'

(( $+commands[nvim] )) && alias vim='nvim'
(( $+commands[bat] )) && alias cat='bat'

alias ls='ls --color=auto'
alias ll='ls --group-directories-first -l'
alias la='ls --group-directories-first -l --all'
alias l='ll'
if (( $+commands[exa] )); then
    alias ls='exa --time-style long-iso'
    alias ll='ls -lgbh --git'
    alias lg='ll -G'    # List by grid
    alias llg='ll -G'
    alias la='ll -a'
    alias lag='llg -a'
    alias ldot='ll -d .*'
    alias lss='ll -s size'
    alias lst='ll -s modified'
    alias tree='ls --tree'
fi

alias vv='vim $(fzf)'
alias vi=vim
alias vi2='vim -O2'
alias vw=gvim
alias em='emacsclient -t'
alias ew='emacsclient -c -a emacs'

alias gv='vim +GV +"autocmd BufWipeout <buffer> qall"'

alias f='fzf -m'

# copy alias
alias pc='pbcopy'
alias pp='pbpaste'
alias pcurl='pp | xargs curl -s '
alias pget='pp | xargs wget'
alias pclone='pp | xargs git clone'
alias peval='pp | bash'

alias mux=tmuxinator
alias tn='tmux new-session -s'
alias daily='tmuxinator daily'

alias weather='curl wttr.in'

alias tl='tmux list-sessions'

# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh
alias gpom='git push origin master'
alias gc='git commit -v'
alias gb='git branch'
alias gl='git pull'
alias gp='git push'
alias gpom='git push origin master'
alias gpoat='git push origin --all && git push origin --tags'
alias gpu='git push upstream'
alias gco='git checkout'
alias gst='git status'
alias gs='git stash'
alias gsp='git stash pop'

alias ra='ranger'

alias mycli='LESS="-S $LESS" mycli'


if [ -d "${HOME}/.Documentations/" ]; then
    alias H-Zsh='${BROWSER:-lynx} ${HOME}/.Documentations/Zsh/Doc/zsh_toc.html'
    alias H-ZshGuide='${BROWSER:-lynx}  ${HOME}/.Documentations/Zsh/guide/zshguide.html'
    alias H-ZshFAQ='${BROWSER:-lynx} /home/dope/.Documentations/Zsh/faq/zshfaq.txt'
    alias H-Vim='${BROWSER:-lynx} ${HOME}/.Documentations/vim/usr_toc.html'
fi
