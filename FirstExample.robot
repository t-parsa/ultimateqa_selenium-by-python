*** Settings ***
Library           SeleniumLibrary
Suite Teardown    Close Browser

*** Variables ***
${URL}            https://ultimateqa.com/automation# 

*** Test Cases ***
Select the Free Course
    [Documentation]           Select the Free Course
    Hover Over Education Menu
    Click Free Courses Menu Item
    Verify Free Courses Page Loaded

*** Keywords ***
Hover Over Education Menu
    [Documentation]           Click the Education menu.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//li[contains(@class, 'menu-item')]/a[contains(text(), 'Education')]    timeout=5
    Mouse Over    xpath=//li[contains(@class, 'menu-item')]/a[contains(text(), 'Education')]

Click Free Courses Menu Item
    [Documentation]           Click the Free Courses item from the Education dropdown.
    Wait Until Element Is Visible    xpath=//li[contains(@class, 'menu-item')]/a[contains(text(), 'Free Courses')]    timeout=5
    Click Element    xpath=//li[contains(@class, 'menu-item')]/a[contains(text(), 'Free Courses')]
    
Verify Free Courses Page Loaded
    [Documentation]           Verify that the Free Courses page loaded successfully.
    Wait Until Element Contains    class=collections__heading    Products



