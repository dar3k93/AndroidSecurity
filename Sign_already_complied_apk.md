### CREATE KEY

  keytool -genkey -v -keystore ***key.keystore*** -alias alias_name -keyalg RSA -keysize 2048 -validity 10000

### SIGN APK

  jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore ***key.keystore*** ***base.apk*** alias_name
