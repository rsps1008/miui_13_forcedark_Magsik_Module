#!/system/bin/sh

make_black_app(){
	cat /data/adb/modules/miui13forcedark/backup/ForceDarkAppSettings.json | sed "y/]/,/" > /data/adb/modules/miui13forcedark/system/etc/ForceDarkAppSettings.json
	my_array=( $(pm list packages -3) )
	for i in "${my_array[@]}"; do
		if [ "$i" = "${my_array[${#my_array[@]}-1]}" ]
		then
			j=${i//package:/}
			echo "{\"defaultEnable\":false,\"overrideEnableValue\":0,\"packageName\":\"$j\",\"showInSettings\":true}" >> /data/adb/modules/miui13forcedark/system/etc/ForceDarkAppSettings.json
			echo "]" >> /data/adb/modules/miui13forcedark/system/etc/ForceDarkAppSettings.json
		else
			j=${i//package:/}
			echo "{\"defaultEnable\":false,\"overrideEnableValue\":0,\"packageName\":\"$j\",\"showInSettings\":true}," >> /data/adb/modules/miui13forcedark/system/etc/ForceDarkAppSettings.json
		fi
	done
}

make_black_app
