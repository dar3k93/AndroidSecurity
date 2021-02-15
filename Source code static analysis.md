- [Key_word](#Key_Word)
  - [Application entry points](#Entry_points)
  - [Wordlist](#Wordlist)
  - [Quick grep](#Quick_grep)
  
- [Smali](#Smali)

- [Root binaries](#Root)

## Key_word
  
  ### Entry_points
    -
  
  ### Wordlist
    - API calls
      - ActivityManager
      - PackageManager
      - WifiManager
      - QueryIntentActivites
      - getRunningAppProcessoes
      - SensorManager
      - BluetoothAdapter
      - Address
      - LocationManager
      - TelephonyManager
      - AdvertisingIdClient
    - File
      - file
      - read
      - write
      - directory
      - sdcard
      - document
    - Net
       - http
       - https
       - connect
       - socket
       - uri
       - loadUrl
       - post
       - .com
       - .net
       - url
     - Other
       - API key
       - secret key
       - token/tokens
       - username
       - password
       - activites
       - intent
       - Valid/Validator
       - WebView
       - private
       - endpoint
       - content
       - javascript
       - loadLibrary
       - native
       - install
       - addJavaScriotInterface
     - Function
       - getExternal
       - getWriteableDatabase 
       - getReadableDatabase 
       - getCacheDir 
       - getExternalCacheDirs
     - Classes
       - SharedPreferences 
       - FileOutPutStream 
       
  ### Quick grep
    - search for log methods
    ```
    grep -Ei 'Log.v' -Ei 'Log.d' -Ei 'Log.i' -Ei 'Log.w' -Ei 'Log.e' -Ei 'log' -Ei 'logger' -Ei 'printStackTrace' -Ei 'System.out.print' -Ei 'System.err.print' -R .
    ```
    
    - search for config etc
    ```
    grep -Ei 'username' -Ei 'user' -Ei 'userid' -Ei 'password' -Ei '.config' -Ei 'secret' -Ei 'pass' -Ei 'passwd' -Ei 'token' -Ei 'login' -Ei 'auth' -R .
    ```
    
    - search for endpoint
    ```
    grep -Ei 'api' -Ei ‘http’ -Ei 'https' -Ei 'URI' -Ei 'URL' -R .
    ```
    
    - check sensitive in cache
    ```
    grep -Ei 'getCacheDir' -Ei 'getExternalCacheDirs' -R .
    ```
    
    - check database pattern
    ```
    grep -Ei 'localUserSecretStore' -Ei 'getWriteableDatabase' -Ei 'getReadableDatabase' -Ei 'SQLiteDatabase' -Ei ‘realm' -Ei 'getDefaultInstance' -Ei 'beginTransaction' -Ei 'insert' -Ei 'query' -Ei 'delete' -Ei 'update' -R .
    ```
    
    - check improper file permission
    ```
    grep -Ei 'MODE_WORLD_READABLE' -Ei 'MODE_WORLD_WRITEABLE' -R .
    ```
    
    - check for keystore
    ```
    grep -Ei 'AndroidKeystore' -Ei 'KeyStore' -Ei 'crypto' -Ei 'cipher' -Ei 'store' -R .
    ```
  
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## Smali

### Primitives 
- V : void can only be used for return types
- B : byte
- S : short
- C : char
- I : int
- J : long (64 bits)
- F : float
- D : double
- Z : boolean

### Object
```
Lpackage/name/ObjectName; L indicates that it is an object type
Ljava/lang/String; is equivalent to java.lang.String
````
### Methods
```
Lpackage/name/ObjectName;->MethodName(III)Z
```
- MethodName : Method name
- (III) : Parameters. In this case 3 ints
- Z : return type (boolean)

### Fields
```
Lpackage/name/ObjectName;->FieldName:Ljava/lang/String;
```
- FieldName : Field name
- Ljava/lang/String; : type of the field

### Smali registers
- v0, v1, v2 : local registers
- p0, p1, p2 : method argument alias e.g (p0 == this)

### Case study
```
//TO DO, ADD smali code
```

## Root

### Instaled Files and Packages

- su binaries
```
/system/bin/su
/system/xbin/su
/sbin/su
/system/su
/system/bin/.ext/.su
/system/usr/we-need-root/su-backup
/system/xbin/mu
/data/local/
/data/local/bin/
/data/local/xbin/
/sbin/
/su/bin/
/system/bin/
/system/bin/.ext/
/system/bin/failsafe/
/system/sd/xbin/
/system/usr/we-need-root/
/system/xbin/
/system/app/Superuser.apk
/cache
/data
/dev
```
- packages 
```
com.noshufou.android.su
com.thirdparty.superuser
eu.chainfire.supersu
com.koushikdutta.superuser
com.zachspong.temprootremovejb
com.ramdroid.appquaranti

1|a5y17lte:/ # pm list packages
package:com.wssyncmldm
package:com.android.location.fused
package:com.samsung.android.samsungpassautofill
package:com.sec.epdg
package:com.android.systemui
package:eu.chainfire.supersu
```




