# NextGenDataManager

## Steps to create this framework
1. Create a new Touch Framework in XCode.
2. PROJECT -> Deployment Target -> `8.0`. Default is 10.0 but we need to support 8.0 in our project.
3. Edit Scheme -> check `Shared`. This is required for Carthage.
4. Drage `Source` folder into project.
5. Remove `Source/libxml` reference out of project.
6. Build Settings:
 - Other Linker Flags: `-lxml2`
 - Header Search Paths: `$(SDKROOT)/usr/include/libxml2`
 - Swift Compiler -> Import Paths: `${SRCROOT}/Source/libxml`
 
## Carthage support
 Add this line into Cartfile:
 ```
 github "BLVudu/NextGenDataManager" "master"
 ```
 Run your `carthage update`
