# Defined in - @ line 1
function myfuse --wraps='sshfs jfox10@ssh.cs.brown.edu:/gpfs/main/home/jfox10 ~/browncs && cd ~/browncs' --description 'alias myfuse sshfs jfox10@ssh.cs.brown.edu:/gpfs/main/home/jfox10 ~/browncs && cd ~/browncs'
  sshfs jfox10@ssh.cs.brown.edu:/gpfs/main/home/jfox10 ~/browncs && cd ~/browncs $argv;
end
