SKIPUNZIP=0

if [ -d "/data/adb/modules/miui13forcedark" ]; then
	ui_print "---Detect Module Existing---"
	cat /data/adb/modules/miui13forcedark/backup/ForceDarkAppSettings.json | sed "y/]/,/" > /data/local/tmp/ForceDarkAppSettings.json
	ui_print
	ui_print "---Backuping Factory ForceDarkAppSettings.json..."
	cp /data/adb/modules/miui13forcedark/backup/ForceDarkAppSettings.json $MODPATH/backup/ForceDarkAppSettings.json
	sleep 1s
	ui_print "- Backup successfully"
	ui_print
	
else
	ui_print "---Module Not Existing---"
	cat /system/etc/ForceDarkAppSettings.json | sed "y/]/,/" > /data/local/tmp/ForceDarkAppSettings.json
	ui_print
	ui_print "---Backuping Factory ForceDarkAppSettings.json..."
	cp /system/etc/ForceDarkAppSettings.json $MODPATH/backup/ForceDarkAppSettings.json
	sleep 1s
	ui_print "- Backup successfully"
	ui_print
fi

ui_print "---Getting APP list and create new ForceDarkAppSettings.json"
/bin/sh $MODPATH/dark.sh
sleep 1s
ui_print "- Create successfully"
ui_print
ui_print "---Appling New ForceDarkAppSettings.json..."
cp -f /data/local/tmp/ForceDarkAppSettings.json $MODPATH/system/etc/ForceDarkAppSettings.json
sleep 1s
ui_print "- Apply successfully"
ui_print
ui_print "---Cleaning temporary files..."
rm /data/local/tmp/ForceDarkAppSettings.json
sleep 1s
ui_print "- Clean successfully"
ui_print
ui_print
ui_print "---Complete the module installation---"