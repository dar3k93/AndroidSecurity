### Vuln app: OWASP Uncrackable1

#### 1) Code analysis with jadx tool

##### class c method a(), b(), c()
```
public static boolean a() {
        for (String file : System.getenv("PATH").split(":")) {
            if (new File(file, "su").exists()) {
                return true;
            }
        }
        return false;
    }

    public static boolean b() {
        String str = Build.TAGS;
        return str != null && str.contains("test-keys");
    }

    public static boolean c() {
        for (String file : new String[]{"/system/app/Superuser.apk", "/system/xbin/daemonsu", "/system/etc/init.d/99SuperSUDaemon", "/system/bin/.ext/.su", "/system/etc/.has_su_daemon", "/system/etc/.installed_su_daemon", "/dev/com.koushikdutta.superuser.daemon/"}) {
            if (new File(file).exists()) {
                return true;
            }
        }
        return false;
    }
```

##### class MainActivity method a
```
private void a(String str) {
        AlertDialog create = new Builder(this).create();
        create.setTitle(str);
        create.setMessage("This is unacceptable. The app is now going to exit.");
        create.setButton(-3, "OK", new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                System.exit(0);
            }
        });
        create.setCancelable(false);
        create.show();
    }
```
#### 2) Reverse engineering apk file
