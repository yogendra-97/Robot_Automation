
*** Settings ***

Library    SeleniumLibrary
Resource        data_provider.robot
Test Setup      Open browser    https://flipkart.com
# It runs in the begining of a test
Test Teardown       Close Browser
# It runs after the test completion or at the end

*** Variables ***

${login_button}=    xpath://span[text()='Login']
${Ph_no}=   xpath://*[@id="container"]/div/div[3]/div/div[2]/div/form/div[1]/input
${OTP_button}=      xpath://button[text()='Request OTP']

*** Test Cases ***

Open Flipkart
    Login Page
    Assertion

*** Keywords ***

Login Page
    click element   ${login_button}
    input text    ${ph_no}      8077716374
    click element    ${OTP_button}
Assertion
    ${Number}=    get value    xpath://*[@id="container"]/div/div[3]/div/div[2]/div/form/div[1]/input
    should be equal as integers    ${number}    8077716371
#   element attribute value should be    ${ph_no}     8077716371