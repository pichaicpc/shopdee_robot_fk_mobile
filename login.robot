*** Settings ***
Documentation     Login Test Suite
Library           AppiumLibrary

*** Variables ***
${URL}                        http://127.0.0.1:4723
${ANDROID_AUTOMATION_NAME}    UiAutomator2
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=13}
${ANDROID_APP}                C:\\Users\\hp\\Downloads\\shopdee_android\\app\\build\\outputs\\apk\\debug\\app-debug.apk
${VALID_USERNAME}    nadech
${VALID_PASSWORD}    12345678
${INVALID_USERNAME}    test
${INVALID_PASSWORD}    1234

*** Test Cases ***
Valid Login Test
  [Documentation]    เข้าสู่ระบบด้วยชื่อผู้ใช้และรหัสที่ถูกต้อง
  [tags]             smoke
  Open Test Application
  Input Text        id=th.ac.rmutto.shopdee:id/editTextUsername    ${VALID_USERNAME} 
  Input Text        id=th.ac.rmutto.shopdee:id/editTextPassword    ${VALID_PASSWORD}
  Click Element     id=th.ac.rmutto.shopdee:id/buttonLogin  
  Wait Until Element Is Visible   id=th.ac.rmutto.shopdee:id/main_home    timeout=10s
  Close Application

Invalid Login Test
  [Documentation]    เข้าสู่ระบบด้วยชื่อผู้ใช้และรหัสที่ไม่ถูกต้อง
  [tags]                 
  Open Test Application
  Input Text        id=th.ac.rmutto.shopdee:id/editTextUsername    ${INVALID_USERNAME} 
  Input Text        id=th.ac.rmutto.shopdee:id/editTextPassword    ${INVALID_PASSWORD}
  Click Element     id=th.ac.rmutto.shopdee:id/buttonLogin    
  Wait Until Element Is Visible   id=th.ac.rmutto.shopdee:id/main_login    timeout=10s
  Close Application 

*** Keywords ***
Open Test Application
  Open Application    ${URL}    automationName=${ANDROID_AUTOMATION_NAME}   platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}  app=${ANDROID_APP}
  Wait Until Element Is Visible  id=th.ac.rmutto.shopdee:id/main_login
