# ~/profile.d/prompt.sh

if [ -e "$ZSH_VERSION" ]; then
    PS1="[%n@%M %d]$ "
else
    PS1="[\u@\h \W]\$ "
fi

export PS1
