rnj() {
  if [ -z "$1" ]; then
    echo "Usage: rnj <ClassName>"
    return 1
  fi
  javac "$1.java" && java "$1"
}

alias gitx='git add .; git commit; git push;'
alias runj='rnj'
alias l='ls'
alias cl='clear'

alias run='f() { clang++ -std=c++17 -O2 -Wall -ggdb -Wextra "$1.cc" -o "$1" && ./"$1"; }; f'
alias white='play -n synth pinknoise vol 0.1 repeat 1'
alias now="awk '/^$/{exit} !/^\[x\]/' ~/0now"
alias yay="nvim ~/0now"
alias vergil="cd /home/salad/apps/ptII ; ./bin/vergil; cd -"
alias copy="xclip -selection clipboard"
