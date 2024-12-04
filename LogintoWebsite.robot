*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    https://www.saucedemo.com/    chrome
Suite Teardown    Close Browser

*** Variables ***
${USERNAME}       standard_user
${PASSWORD}       secret_sauce

*** Test Cases **
Valid Login Test
    [Documentation]    TC to validate successful login
    Input Username     ${USERNAME}
    Input Password     ${PASSWORD}
    Click Login Button
    Verify Successful Login

*** Keywords ***
Input Username
    [Arguments]    ${username}
    Input Text    id=user-name    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    id=password    ${password}

Click Login Button
    Click Button    id=login-button

Verify Successful Login
    Wait Until Page Contains Element    xpath=//span[@class='title']    timeout=5
    Element Text Should Be    xpath=//span[@class='title']    Products
