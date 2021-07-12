rem #if (Paket)
dotnet tool restore
IF NOT EXIST paket.lock (
    dotnet paket install
) ELSE (
    dotnet paket restore
)
rem #endif
dotnet restore
dotnet build ./src/AppName.1 --no-restore
rem #if (!ExcludeTests)
dotnet test ./tests/AppName.1.Tests --no-build
rem #endif