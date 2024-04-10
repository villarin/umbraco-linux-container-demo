FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR build
COPY src .
RUN dotnet publish ./Umbraco13.Demo.csproj -c Release -o . --os linux

FROM mcr.microsoft.com/dotnet/aspnet:8.0

WORKDIR app
COPY --from=build-env /build .
COPY entry-point.sh .
RUN chmod 750 entry-point.sh

RUN rm -rf /mnt/volume Views App_Plugins wwwroot/css wwwroot/media umbraco/Data umbraco/Logs && mkdir -p /mnt/volume && echo "Folder structure setup started..."
RUN mkdir -p /mnt/volume/src/Views  /mnt/volume/src/App_Plugins /mnt/volume/data /mnt/volume/logs umbraco && echo "Folder structure setup started..."
RUN ln -sf /mnt/volume/src/Views Views && ln -sf /mnt/volume/src/App_Plugins App_Plugins && ln -sf /mnt/volume/data umbraco/Data && ln -sf /mnt/volume/logs umbraco/Logs && echo "Folder structure ready!"

ENV ASPNETCORE_URLS "http://*:8000"
ENV ASPNETCORE_HTTP_PORTS "8000"
#ENV ASPNETCORE_ENVIRONMENT "Development" #Uncomment for visibility if you have setup issues 
RUN apt-get update && apt-get -y install wget

EXPOSE 8000
ENTRYPOINT ["./entry-point.sh"]