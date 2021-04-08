# Defined in - @ line 1
function secure --wraps=read\ --silent\ --prompt-str\ \'🔏\ \' --description alias\ secure\ read\ --silent\ --prompt-str\ \'🔏\ \'
  read --silent --prompt-str '🔏 ' $argv;
end
