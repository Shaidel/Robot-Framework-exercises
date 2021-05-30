*** Settings ***
Library     AppiumLibrary

*** Variables ***
${AppiumURL}  http://127.0.0.1:4723/wd/hub
${PlatformName}  Android
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${PlatformVersion}  7.1.1
${PhoneName}  emulator-5554
${AppPackage}  io.selendroid.testapp
${AppActivity}  io.selendroid.testapp.HomeScreenActivity

@{ROBOTS}=        Andrzej    Kamil    Patryk

*** Test Cases ***
10 test cases
  Test1
  Test2
  Test3
  Test4
  Test5
  Test6
  Test7
  Test8
  Test9
  Test10


*** Keywords ***
Run application
    Open Application
    ...        ${AppiumURL}
    ...        automationName=${ANDROID_AUTOMATION_NAME}
    ...        newCommandTimeout=3600
    ...        logLevel=Error
    ...        platformName=${PlatformName}
    ...        platformVersion=${PlatformVersion}
    ...        deviceName=${PhoneName}
    ...        appPackage=${AppPackage}
    ...        appActivity=${AppActivity}


Test1
#Xpath locator
    Run application
    click element    xpath=//android.widget.ImageButton[@content-desc="startUserRegistrationCD"]
    wait until element is visible    id=io.selendroid.testapp:id/inputUsername    3000
    click element    id=io.selendroid.testapp:id/inputUsername
    input text    id=io.selendroid.testapp:id/inputUsername    Umiem w Robota xD
    clear text    id=io.selendroid.testapp:id/inputUsername
    sleep  3s
    close application

Test2
#ID locator
    Run application
    click element    id=io.selendroid.testapp:id/startUserRegistration
    sleep  3s
    close application

Test3
#Accessibility_id locator
    Run application
    click element    accessibility_id=startUserRegistrationCD
    sleep  3s
    close application

Test4
#Text input
    Run application
    input text    accessibility_id=my_text_fieldCD    test
    sleep  3s
    close application

Test5
#Swipe example
    Run application
    click element    id=io.selendroid.testapp:id/touchTest
    sleep  3s
    swipe    0    100    100    0    1000
    sleep  3s
    close application

Test6
#For loop example with arguments from variables
    Run application
    FOR    ${robot}    IN    @{ROBOTS}
        input text    accessibility_id=my_text_fieldCD    ${robot}_
        sleep  3s
    END
    close application

Test7
    Run application
    click element    accessibility_id=waitingButtonTestCD
    sleep  3s
    close application

Test8
    Run application
    click element    accessibility_id=visibleButtonTestCD
    sleep  3s
    close application

Test9
    Run application
    click element    accessibility_id=showToastButtonCD
    sleep  3s
    close application

Test10
    Run application
    click element    accessibility_id=showPopupWindowButtonCD
    sleep  3s
    close application