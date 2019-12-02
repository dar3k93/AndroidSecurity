#### Get list of exported Broadcast Receivers, you can use drozer script.

#### Decompiled the apk file and check the source code

#### Payload example:
drozer> run app.broadcast.send --action <EXPORTED BROADCAST RECEIVER> 
  --component <FULL PACKAGE NAME example: com.some.example.class>
  ***if class accept some argument example "getSting"***
  --extra <string parametr_name value>
