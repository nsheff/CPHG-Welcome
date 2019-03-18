# to refresh the .bash_profile after edits:
# exec "$BASH" replaces current shell with a new instance of the shell
# source ~/.bashrc preserves current shell


# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

# added by Anaconda3 installer
export PATH="/Users/chd5n/anaconda3/bin:$PATH"

# required for globus-cli
export PATH="/Users/chd5n/.local/bin:${PATH}"

# to get colors in terminal as in linux
export CLICOLOR=1
#for light blue directories
export LSCOLORS=Exfxcxdxbxegedabagacad

##
# Your previous /Users/chd5n/.bash_profile file was backed up as /Users/chd5n/.bash_profile.macports-saved_2019-01-11_at_17:55:18
##

# MacPorts Installer addition on 2019-01-11_at_17:55:18: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# to access commonly used pathnames without typing escape characters
big="BIG-IP\ Edge\ Client"
excel="Microsoft\ Excel"
outlook="Microsoft\ Outlook"
mau="Microsoft\ AutoUpdate"
