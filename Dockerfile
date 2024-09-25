
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env

RUN mkdir -p /Interfaces
WORKDIR /App
# Copy everything
COPY ./PointCloudConverterForDotnetCLI ./
COPY ./Interfaces /Interfaces
# Restore as distinct layers
RUN dotnet restore
# Build and publish a release
#RUN dotnet publish --os linux  -c LinuxRelease -o out
RUN dotnet publish --runtime linux-x64  -c LinuxRelease -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/sdk:8.0
WORKDIR /App
COPY --from=build-env /App/out .
ENTRYPOINT ["dotnet", "PointCloudConverterForDotnetCLI.dll"]
# install Docker tools (cli, buildx, compose)
COPY --from=gloursdocker/docker / /

#
#
#FROM mcr.microsoft.com/dotnet/sdk:8.0
#
#WORKDIR /App
#
## Copy everything
#COPY ./bin/LinuxRelease/net8.0/linux-x64/publish/. .
## Restore as distinct layers
##RUN dotnet restore
## Build and publish a release
##RUN dotnet publish -c Release -o out
#
## Build runtime image
#
#WORKDIR /App
##COPY --from=build-env /App/out .
#ENTRYPOINT ["dotnet", "PointCloudConverterForDotnetCLI.dll"]
#
## install Docker tools (cli, buildx, compose)
#COPY --from=gloursdocker/docker / /