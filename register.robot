*** Settings ***
Documentation     Register Test Suite
Library           AppiumLibrary

*** Variables ***
${URL}                        http://127.0.0.1:4723
${ANDROID_AUTOMATION_NAME}    UiAutomator2
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   13
${ANDROID_APP}                C:\\Users\\hp\\Downloads\\shopdee_android\\app\\build\\outputs\\apk\\debug\\app-debug.apk
${USERNAME}                   prapa
${PASSWORD}                   12345678
${FIRST_NAME}                 ประภา
${LAST_NAME}                  จันทร์งาม

*** Test Cases ***
Valid Register Test
  [Documentation]   สมัครสมาชิกด้วยข้อมูลผู้สมัครที่ครบถ้วน
  [tags]            smoke
  Open Test Application    
  Input Text        id=th.ac.rmutto.shopdee:id/editTextUsername    ${USERNAME}
  Input Text        id=th.ac.rmutto.shopdee:id/editTextPassword    ${PASSWORD}
  Input Text        id=th.ac.rmutto.shopdee:id/editTextFirstname   ${FIRST_NAME}
  Input Text        id=th.ac.rmutto.shopdee:id/editTextLastname    ${LAST_NAME}
  Click Element     id=th.ac.rmutto.shopdee:id/buttonSubmit  
  Wait Until Element Is Visible  id=th.ac.rmutto.shopdee:id/main_login
  Close Application

Register with Incomplted Data
  [Documentation]       กรณีข้อมูลไม่ครบถ้วน 
  Open Test Application
  Validate Text Input   th.ac.rmutto.shopdee:id/editTextUsername    ${USERNAME}
  Validate Text Input   th.ac.rmutto.shopdee:id/editTextPassword    ${PASSWORD}
  Validate Text Input   th.ac.rmutto.shopdee:id/editTextFirstname   ${FIRST_NAME}
  Validate Text Input   th.ac.rmutto.shopdee:id/editTextLastname    ${LAST_NAME}
  Close Application

Register with Existing Username
  [Documentation]   กรณีชื่อผู้ใช้ซ้ำ
  Open Test Application
  Input Text        id=th.ac.rmutto.shopdee:id/editTextUsername    ${USERNAME}
  Input Text        id=th.ac.rmutto.shopdee:id/editTextPassword    ${PASSWORD}
  Input Text        id=th.ac.rmutto.shopdee:id/editTextFirstname   ${FIRST_NAME}
  Input Text        id=th.ac.rmutto.shopdee:id/editTextLastname    ${LAST_NAME}
  Click Element     id=th.ac.rmutto.shopdee:id/buttonSubmit  
  Wait Until Page Does Not Contain Element  id=th.ac.rmutto.shopdee:id/main_login 


*** Keywords ***
Open Test Application
  Open Application    ${URL}    automationName=${ANDROID_AUTOMATION_NAME}   platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}  app=${ANDROID_APP}
  Wait Until Element Is Visible  id=th.ac.rmutto.shopdee:id/main_login
  Click Element     id=th.ac.rmutto.shopdee:id/textViewRegister
  Wait Until Element Is Visible  id=th.ac.rmutto.shopdee:id/main_register

Validate Text Input
  [Arguments]       ${input_text_id}       ${input}  
  Click Element     id=th.ac.rmutto.shopdee:id/buttonSubmit  
  Wait Until Page Does Not Contain Element  id=th.ac.rmutto.shopdee:id/main_login  
  Input Text        id=${input_text_id}    ${input}