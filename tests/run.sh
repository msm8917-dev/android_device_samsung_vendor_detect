mkdir -p device
for vendor in samsung xiaomi motorola; do 
	for device in a10 vince bomb vendor_detect; do
		mkdir device/$vendor/$device -p;
		cp lineage.mk device/$vendor/$device/lineage_$device.mk
	done
done
for i in device/*/vendor_detect; do
        cd $i;
        for j in $(ls ../../../../*.sh); do
                ln -sf $j;
        done;
        echo derp > vendor_name
        cd -;
done
export DEBUG=1
for i in device/*/vendor_detect/vendorsetup.sh; do
	bash $i;
done
