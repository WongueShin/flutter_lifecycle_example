# flutter_lifecycle_example
This is an example to check the difference in Applifecycle between Flutter platforms.
## Android

<img src="https://github.com/WongueShin/flutter_lifecycle_example/blob/master/img/android/flutter_android_applifecycle.png?raw=true" width="600"/>

<p>
  minimize
  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
  background
</p>
<p>
<img src="https://github.com/WongueShin/flutter_lifecycle_example/blob/master/img/android/flutter_android_applifecycle_minimaze.gif?raw=true" width = "200"/>
<img src="https://github.com/WongueShin/flutter_lifecycle_example/blob/master/img/android/flutter_android_applifecycle_background.gif?raw=true" width="200"/>
</p>
backgroundkill
<img src="https://github.com/WongueShin/flutter_lifecycle_example/blob/master/img/android/flutter_android_applifecycle_backgroundkill.png?raw=true" width="600"/>

* When minimized, you can see that there is no change in AppLifecycle State.
* When you go to the foreground after entering the background, you can see that there is a change in AppLifecycleState in the order of inactive - paused - resumed.
* If you kill the app directly in the background, you can see that a separate State change is not detected.

## IOS
<img src="https://github.com/WongueShin/flutter_lifecycle_example/blob/master/img/ios/flutter_ios_applifecycle.png?raw=true" width="600"/>

<p>
  minimize
  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
  background
</p>
<p>
<img src="https://github.com/WongueShin/flutter_lifecycle_example/blob/master/img/ios/flutter_ios_applifecycle_minimaze.gif?raw=true" width = "200"/>
<img src="https://github.com/WongueShin/flutter_lifecycle_example/blob/master/img/ios/flutter_ios_applifecycle_background.gif?raw=true" width="200"/>
</p>
backgroundkill
<img src="https://github.com/WongueShin/flutter_lifecycle_example/blob/master/img/ios/flutter_ios_applifecycle_backgroundkill.png?raw=true" width="600"/>

* When minimized, you can see the status change from inactive - resume.
* In background, you can see the status change of inactive - paused - inactive - resume.
* When the app kills in the background, you can see the status change from inactive - paused - detached.
