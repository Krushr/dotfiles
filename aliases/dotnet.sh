alias dn="dotnet $@"

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

alias dnt="dotnet test"

dntp() {
  dotnet test --project "$@"
}

alias dnb="dotnet build"

dnbp() {
  dotnet test --project "$@"
}

alias dnw="dotnet watch"
