#### Get list of exported Broadcast Receivers, you can use drozer script.

#### Broadcast: Component runs in the background without UI. For example Music playing service.
#### Intent: Allows to interact with other android component.
#### Exported: Attribute with says wether the service can be accessed by other application or not.

### Identify Broadcast Receiver is exported
- Use **APKTOOL -d file.apk**
- Check the manifest file for receiver tag and exported attribute if it is True and if there is no other permission is set.

#### Decompiled the apk file and check the source code


#### Payload example:
drozer> 'run app.broadcast.send --action <EXPORTED BROADCAST RECEIVER> 
  --component <FULL PACKAGE NAME example: com.some.example.class>
  ***if class accept some argument example "getSting"***
  --extra <string parametr_name value>'
