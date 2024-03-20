#!/bin/bash

export ZIPPED_NAME=`basename $ANDROID_PRODUCT_OUT`_`date "+%Y%m%d_%H%M%S"`

echo Product: $ANDROID_PRODUCT_OUT
echo Images: $ZIPPED_NAME

mkdir -p $ZIPPED_NAME/files
cd $ZIPPED_NAME/files

cp $ANDROID_PRODUCT_OUT/system-qemu.img system.img
cp $ANDROID_PRODUCT_OUT/vendor.img vendor.img
cp $ANDROID_PRODUCT_OUT/ramdisk.img ramdisk.img
cp $ANDROID_PRODUCT_OUT/ramdisk.img ramdisk.img
if [ -f $ANDROID_PRODUCT_OUT/kernel-ranchu-64 ]; then
    cp $ANDROID_PRODUCT_OUT/kernel-ranchu-64 kernel-ranchu-64
else
    cp $ANDROID_PRODUCT_OUT/kernel-ranchu kernel-ranchu
fi;
cp -r $ANDROID_PRODUCT_OUT/data .
cp -r $ANDROID_PRODUCT_OUT/advancedFeatures.ini advancedFeatures.ini
cp -r $ANDROID_PRODUCT_OUT/userdata.img .
cp -r $ANDROID_PRODUCT_OUT/encryptionkey.img .
cp -r $ANDROID_PRODUCT_OUT/build.prop .
mkdir system
cp -r $ANDROID_PRODUCT_OUT/build.prop system/build.prop
cp -r $ANDROID_PRODUCT_OUT/VerifiedBootParams.textproto .
cp -r $ANDROID_PRODUCT_OUT/source.properties .

cd ..
zip -1rq $ZIPPED_NAME.zip files

echo Generate result:
ls -l $ZIPPED_NAME.zip

