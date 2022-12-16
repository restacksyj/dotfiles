function _nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

# function _nnvmd
#     bass source ~/.nvm/nvm.sh --no-use ';' nvm alias default $argv && bass source ~/.nvm/nvm.sh --no-use ';' nvm use default
# end

function nnvm    
    if test -e $NVM_CURRENT
        echo Setting up nvm..

        _nvm use default --silent

        set -x -g NVM_CURRENT (_nvm current)

        printf "Using Node %s\n" $NVM_CURRENT
    end

    _nvm $argv
end

