# pos_device_integration

Testing POS device integration printing, etc

## Getting Started

-Steps I followed to install the sdk with flutter:
1- Create android project from android studio and build with Java not kotlin as the sdk is in java then Open the project with android studio with flutter plugin installed.
2- Right click on the android folder > select Flutter > open android project
3- Inside folder app create new directory "aidl" (its path after create should be "android/app/src/main/aidl"
4- Right click on the folder and select "New" then "package".
5- Create the first needed package in the sdk "com.vfi.smartpos.deviceservice"
6- Create the second package "com.vfi.smartpos.system_service"
7- Copy sdk files inside those folder from folders with the same name inside the sdk source code.
8- To use the sdk in flutter we create the native methods to be called from dart in "MainActivity.java" file inside "android/app/src/main/java/com.example/my_app_name"
9- Also in this sdk 2 files "ExtraFiles.java", "PrinterFonts.java" are copied in the same path of MainActivity.java.
10- Use the methods from dart using the same method channel. see app example "pos_device_integration"
