- [Exported Activity Bypassing](#Exported_activity_bypassing)
  - [Manifset](#Manifset)

# Exported_activity_bypassing

## Manifset
```
<activity android:label="@string/title_activity_post_login" 
android:name="com.android.insecurebankv2.PostLogin" android:exported="true"/>

Bypassing: adb shell am start -n com.android.insecurebankv2/com.android.insecurebankv2.PostLogin
```


