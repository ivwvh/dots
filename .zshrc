export EDITOR="nvim"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST


ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH=$HOME/.config/rofi/scripts:$HOME/bin:$PATH
xrdb ~/.config/X11/Xresources.d/st
