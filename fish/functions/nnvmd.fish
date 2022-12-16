function _nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

function nnvmd
   _nvm alias default $argv && _nvm use default
end
