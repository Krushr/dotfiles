dnn() {
  dotnet new $1 -o $2
}

alias dnr="dotnet run"

dnrp() {
  dotnet run --project $1
}
