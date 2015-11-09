
@echo off
setlocal ENABLEDELAYEDEXPANSION
set loop=0
for /F "tokens=*" %%A in (.config) do (
    SET /A loop=!loop! + 1
    set %%A
)

win_adb kill-server

win_adb devices

sleep 5
win_adb reboot bootloader
win_fastboot devices

sleep 5
echo "Flash Apps..."

win_fastboot flash boot out/target/product/%PRODUCT_NAME%/boot.img

win_fastboot flash system out/target/product/%PRODUCT_NAME%/system.img

win_fastboot flash persist out/target/product/%PRODUCT_NAME%/persist.img

win_fastboot flash recovery out/target/product/%PRODUCT_NAME%/recovery.img

win_fastboot flash cache out/target/product/%PRODUCT_NAME%/cache.img

win_fastboot flash userdata out/target/product/%PRODUCT_NAME%/userdata.img


echo "Done..."

win_fastboot reboot


echo "Just close the windows as you wish."

