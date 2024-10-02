---------------------------------------------------------------------
Set-up for Testing Android App.
---------------------------------------------------------------------
1. Install AppiumLibrary
   Go to : https://github.com/serhatbolsu/robotframework-appiumlibrary
   c:\ pip install --upgrade robotframework-appiumlibrary
2. Install Appium
   Go to : https://appium.io/docs/en/latest/quickstart/install/
   c:\ npm install -g appium
   c:\ appium
3. Install the UiAutomator2 Driver
   - Go to : https://appium.io/docs/en/latest/quickstart/uiauto2-driver/
   - Add JAVA_HOME and ANDROID_HOME environment variables.
      JAVA_HOME : C:\Program Files\Java\<CHANGE_YOUR_VERSION>
      ANDROID_HOME : C:\Users\<CHANGE_YOUR_USER>\AppData\Local\Android\Sdk
   - c:\ appium driver install uiautomator2
4. Install Appium Inspector (Optional)
   Go to : https://github.com/appium/appium-inspector
