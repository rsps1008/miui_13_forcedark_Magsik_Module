cat /system/etc/ForceDarkAppSettings.json | sed "y/]/,/" > /data/local/tmp/ForceDarkAppSettings.json
my_array=( $(pm list packages -3) )
for i in "${my_array[@]}"; do
	if [ "$i" = "${my_array[${#my_array[@]}-1]}" ]
	then
		j=${i//package:/}
		echo "{\"defaultEnable\":false,\"overrideEnableValue\":0,\"packageName\":\"$j\",\"showInSettings\":true}" >> /data/local/tmp/ForceDarkAppSettings.json
		echo "]" >> /data/local/tmp/ForceDarkAppSettings.json
	else
		j=${i//package:/}
		echo "{\"defaultEnable\":false,\"overrideEnableValue\":0,\"packageName\":\"$j\",\"showInSettings\":true}," >> /data/local/tmp/ForceDarkAppSettings.json
	fi
done