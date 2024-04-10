#!/bin/bash
ln -sf /mnt/volume/wwwroot/css  wwwroot/css && ln -sf /mnt/volume/wwwroot/media wwwroot/media
if [ ! -d "/mnt/volume/data" ]; then 
	mkdir -p /mnt/volume/wwwroot/css /mnt/volume/wwwroot/media /mnt/volume/data /mnt/volume/logs
	echo "Download and Unpack BlockGrid Example Website assets..."
	wget -qO- https://github.com/umbraco/Umbraco.BlockGrid.Example.Website/archive/refs/tags/v1.0.2.tar.gz | tar xvz
	echo "Copy media and css to volume"
	cp -r ./Umbraco.BlockGrid.Example.Website-1.0.2/UmbracoBlockGrid.Site/wwwroot/media/* ./wwwroot/media/
	cp -r ./Umbraco.BlockGrid.Example.Website-1.0.2/UmbracoBlockGrid.Site/wwwroot/css/* ./wwwroot/css/
	rm -rf Umbraco.BlockGrid.Example.Website*
	echo "Restore pre-packaged database"
	cd /mnt/volume/data
	wget -qO- https://github.com/villarin/umbraco-linux-container-demo/files/14934132/data.tar.gz | tar xvz 
	cd /app
fi

dotnet Umbraco13.Demo.dll 