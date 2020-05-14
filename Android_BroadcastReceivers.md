### Get list of exported BroadcastReceivers, you can use drozer script.

### BroadcastReceivers: 
Component runs in the background without UI. For example Music playing service.

#### Identify BroadcastReceiver is exported
- Use **APKTOOL -d file.apk**
- Check the manifest file for receiver tag and exported attribute if it is True and if there is no other permission is set.

```AndroidMainfest.xml
<receiver android:name="TestBroadcastReceiver" android:exported="true">
<intent-filter>
  <action android:name="TestBroadcast">
  </action>
</intent-filter>
</receiver>
```
#### Decompiled the apk file and check the source code

#### Using adb
```
am broadcast -a TestBroadcast -n com.my.test.app.test/.TestBroadcastReceiver
```
#### Drozer payload example:
drozer> 'run app.broadcast.send --action <EXPORTED BROADCAST RECEIVER> 
  --component <FULL PACKAGE NAME example: com.some.example.class>
  ***if class accept some argument example "getSting"***
  --extra <string parametr_name value>'
