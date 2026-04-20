FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src
COPY . .

RUN dotnet restore SimpleBlog-site/SimpleBlog-site.csproj
RUN dotnet publish SimpleBlog-site/SimpleBlog-site.csproj -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:10.0
WORKDIR /app
COPY --from=build /app/publish .

ENTRYPOINT ["dotnet", "SimpleBlog-site.dll"]
