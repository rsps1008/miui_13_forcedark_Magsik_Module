SKIPUNZIP=0

if [ -d "/data/adb/modules/miui13forcedark" ]; then
	ui_print "- ERROR!!"
	ui_print "- For now, it just can support initialize install to get factory ForceDarkAppSettings.json"
	abort "- Please uninstall this module first"
else
	ui_print "- Get APP list and apply to ForceDarkAppSettings.json"
	cp -f $MODPATH/dark.sh /data/local/tmp/dark.sh
	/bin/sh /data/local/tmp/dark.sh
	sleep 1s
	cp /data/local/tmp/ForceDarkAppSettings.json $MODPATH/system/etc/ForceDarkAppSettings.json
	ui_print "- Apply ForceDarkAppSettings.json successfully"
	ui_print "- Cleaning temporary files..."
	rm /data/local/tmp/ForceDarkAppSettings.json
	rm /data/local/tmp/dark.sh
	sleep 1s
	ui_print "- Complete the module installation"
fi
