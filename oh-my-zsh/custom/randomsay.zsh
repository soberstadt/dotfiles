randomsay() {
  cow=(`cowsay -l | tail -n +2 | tr  " "  "\n" | egrep -v 'telebears|sodomized' | sort -R | head -n 1`)
  cowsay -f $cow "$@"
}
