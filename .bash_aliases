rnj() {
  if [ -z "$1" ]; then
    echo "Usage: rnj <ClassName>"
    return 1
  fi
  javac "$1.java" && java "$1"
}

alias gitx='git add .; git commit; git push;'
alias runj='rnj'

