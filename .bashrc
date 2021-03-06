#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $TERM != "screen" ]] && exec tmux
[ -n "$TMUX" ] && export TERM=screen-256color

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

alias ls='ls -X --color=auto'
alias ll='ls -Ahl'
alias emacs='emacs -nw'
#alias vlc='cvlc'
alias sudo='sudo '
alias suvi='sudo vim'
alias wifi='sudo wifi-menu'

# sysadmin
alias shutdown='sudo shutdown -ht sec 0'
alias reboot='sudo reboot'
alias suspend='sudo pm-suspend'
alias pacman='sudo pacman'

# misc
alias dwmi='~/.scripts/dwminst'
alias nyc='urxvt -fn "xft:nyc:pixel=10"'
alias hcl='rm ~/.bash_history; history -c;'
#alias pacman='echo 'Nothing''

# FALL 2012
alias katz='ssh cs61c-ev@hive8.cs.berkeley.edu'
alias vaz='ssh cs70-ik@star.cs.berkeley.edu'

# PROMPT
PS1='\[\e[1;35m\]\u\[\e[m\]\[\e[1;30m\]:\[\e[m\]\[\e[m\]\[\e[1;37m\]\W\[\e[m\]\[\e[1;33m\]>\[\e[m\] '

# Hz
hertz() {
    cp -a ~/{.dwm,.scripts,.gtkrc-2.0,.bash_profile,.bashrc,.emacs,.hgrc,.ncmpcpp,.rtorrent.rc,.vimrc,.xbindkeysrc,.xinitrc,.Xresources,.mozilla/firefox/h30r20tn.default/chrome/userChrome.css,.fonts,.vimperator,.vimperatorrc,.tmux.conf,.vim} ~/hertz
    cd ~/hertz
    git add . -A
    git commit -m 'auto update'
    git push -u origin master
    cd -
}

# renameZ
mvz() {
    a=1
    for i in *.$2; do
        new=$(printf "$1%02d.$2" ${a})
        mv ${i} ${new}
        let "a = a + 1"
    done
}

# screenshot
sshot() {
    i=$1
    if [[ "$i" == "" ]]; then
        i="sshot.png"
    else
        if [[ ! "$i" == *.png ]]; then
        i="$i.png"
        fi
    fi
    import -window root ~/$i
}

# exztract
#xzt() {
#    for i in *; do
#        7z x ${i}
#    done
#}

# refresh
fresh() {
    xrdb -merge ~/.Xresources
    cd ~/.fonts
    mkfontscale
    mkfontdir
    xset fp rehash
    cd -
}

# lameV
lamev() {
    mkdir new
    for i in *.mp3; do
        lame -V 2 --verbose ${i} new/${i}
    done
}

# underscore
underscore() {
    if [[ ! "$1" == "" ]]; then
        while(true); do
            rename -v ' ' '_' *.${1}
        done
    fi
}
