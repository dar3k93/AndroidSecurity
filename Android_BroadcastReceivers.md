### Get list of exported BroadcastReceivers, you can use drozer script.

### BroadcastReceivers: 
- Component: runs in the background without UI.
- Intent: allows to interact with other android components
- Exported: service can be accessed by other application or root

#### Identify BroadcastReceiver is exported
- When broadcast receiver is exported without any permission restriction, any application can send broadcast message to the exported receiver.

- Use **APKTOOL -d file.apk**

- Check the manifest file for receiver tag and exported attribute.

```AndroidMainfest.xml
<receiver android:name="TestBroadcastReceiver" android:exported="true">
<intent-filter>
  <action android:name="TestBroadcast">
  </action>
</intent-filter>
</receiver>
```
#### Decompiled the apk file and check the source code
- search for 
    - BroadcastReceiver
    - <receiver>
    - onReceive

#### Simple PoC
- create app with intent
```
Intent i = new Intent('my.broadcast.vuln.app');
Some action with intent instance
sendBroadcast(in)
```

#### usefull tools 
- drozer
- am
  

