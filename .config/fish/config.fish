###########################
### Path configurations ###
###########################
set PATH /usr/local/cuda-11/bin $HOME/bin $PATH
set -x LD_LIBRARY_PATH /usr/local/cuda-11/lib64 $LD_LIBRARY_PATH
set -x PYTHONPATH /usr/local/lib $PYTHONPATH

####################
### Shell prompt ###
####################
starship init fish | source

#function ls
#    command ls --color=auto $argv
#end

function myconfig
    command git --git-dir=$HOME/.myconfig/ --work-tree=$HOME $argv
end

