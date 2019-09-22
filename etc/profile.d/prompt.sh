# /etc/profile.d/prompt.sh
#
# Set PS1 to a uniform look across multiple shell environments. The PS1
# should always appear as follows:
#
#   [user@$(hostname -s) $(basename $(pwd))]$
#
# To be clear, we should NEVER use the above example in practice, though
# it should be clear what the desired output would be. If it looks any
# different, then that is considered a bug.

if [ -e "$ZSH_VERSION" ]; then
    PS1="[%n@%M %d]$ "
else
    PS1="[\u@\h \W]\$ "
fi

export PS1
