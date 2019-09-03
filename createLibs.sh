#! /bin/bash

CURRENT_DIR=$PWD
JNI_DIR="${PWD}/app/src/main/jni/"

cd ${JNI_DIR}
echo "build arm64-v8a"
cp Android.mk_arm64-v8a Android.mk
cp Application.mk_arm64-v8a Application.mk
ndk-build -j8

echo "build armeabi-v7a"
cp Android.mk_armeabi-v7a Android.mk
cp Application.mk_armeabi-v7a Application.mk
ndk-build -j8

echo "build armeabi skip"
# cp Android.mk_armeabi Android.mk
# cp Application.mk_armeabi Application.mk
# ndk-build -j8

cd ${CURRENT_DIR}
git checkout app/src/main/jni/Android.mk
git checkout app/src/main/jni/Application.mk
echo "Done!"
