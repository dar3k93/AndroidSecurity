#### Port forward:
  - adb forward tcp:31415 tcp:31415
 
#### Lunch drozer console:
  - drozer console connect

#### List comands/modules
  - list
  
#### Search for app
  - run app.package.list -f <keyword>
  
#### Command description
  -shell: start interactive Linux shell on the device, in the agent context.
  -module: find drozer module and install
  -run MODULE: execute drozer module
  
#### Android app reconnaissance
  
  ###### list all installed app
    - run app.package.list
    
  ###### get application info
    - run app.pacakage.info –a application.package.name
    
  ###### inspect application manifest 
    - run app.package.manifest application.package.name
  
 #### Identify the attack surface
  
  #### Attack surface
    - run app.package.attacksurface application.package.name
    
  #### Exported activities
    - run app.activity.info -a application.package.name
    
  #### Content providers info
    - run app.provider.info -a application.package.name
  ##### Find uri for providers
    - run app.provider.finduri <package name>
  ##### Get info from providers
    - run app.provider.query <uri>
  ##### Check path traverssal in provider 
    - run scanner.provider.traversal -a <package name>
  ##### Check for Sql injection
    - run scanner.provider.injection -a <package name>
  ##### fatch data from content providers
    - run scanner.provider.finduris -a application.package.name
    
         to query result
    
    - run app.provider.query content://etc
        
  ##### scan sqli in content providers
    - run scanner.provider.injection -a application.package.name
    
  ##### scan path traversal vul in content providers
    - run scanner.provider.traversal -a application.package.name
    
 #### Interact with broadcast receiver
    - run app.broadcast.send --action (action from android_manifest file)
  
