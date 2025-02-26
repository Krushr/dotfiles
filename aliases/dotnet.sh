dnn() {
  if [[ $# -eq 2 ]]; then
    dotnet new "$1" -o "$2"
  else
    dotnet new "$@"
  fi
}

alias dnr="dotnet run"

dnrp() {
  dotnet run --project "$@"
}
