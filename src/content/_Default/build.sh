#!/bin/sh
#if (Paket)
dotnet tool restore
if [ ! -e "paket.lock" ]
then
    dotnet paket install
else
    dotnet paket restore
fi
#endif
dotnet restore
dotnet build ./src/AppName.1 --no-restore
#if (!ExcludeTests)
dotnet test ./tests/AppName.1.Tests --no-build
#endif