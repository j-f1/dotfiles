function r --description "npm run" --wraps "npm run"
  npm run $argv[1] -- $argv[2..-1]
end
