*** Settings ***
Library           SeleniumLibrary
Suite Teardown    Close Browser

*** Variables ***
${URL}            https://ultimateqa.com/automation# 

*** Test Cases ***
Select the Free Course
    [Documentation]           Tc to Selecting the Free Course.
    Perform Free Course Selection


Sign In in the Site
    [Documentation]           TC for Signing In to the Website.
    [Setup]                   Perform Free Course Selection
    Hover Over Sign In Button
    Verify Sign In Page Loaded

*** Keywords ***
Perform Free Course Selection
    [Documentation]           Logic to selecting the Free Course.
    Hover Over Education Menu
    Click Free Courses Menu Item
    Verify Free Courses Page Loaded

Hover Over Education Menu
    [Documentation]           Click on the Education menu.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//li[contains(@class, 'menu-item')]/a[contains(text(), 'Education')]    timeout=5
    Mouse Over    xpath=//li[contains(@class, 'menu-item')]/a[contains(text(), 'Education')]

Click Free Courses Menu Item
    [Documentation]           Click on the Free Courses item from the Education dropdown.
    Wait Until Element Is Visible    xpath=//li[contains(@class, 'menu-item')]/a[contains(text(), 'Free Courses')]    timeout=5
    Click Element    xpath=//li[contains(@class, 'menu-item')]/a[contains(text(), 'Free Courses')]
    
Verify Free Courses Page Loaded
    [Documentation]           Verify that the Free Courses page loaded successfully.
    Wait Until Element Contains    class=collections__heading    Products

Hover Over Sign In Button
    [Documentation]           Hover over the Sign In button.
    Wait Until Element Is Visible    xpath=//a[contains(text(), 'Sign In')]    timeout=5
    Mouse Over    xpath=//a[contains(text(), 'Sign In')]

Verify Sign In Page Loaded
  [Documentation]           Verify that the Sign In page loaded successfully.
    Wait Until Page Contains         Sign In
    Click Element     xpath=//div[2]/div/nav/ul/li/a                   
    Wait Until Element Is Visible    xpath=//h2[@class='page__heading']
    # Wait Until Element Is Visible    xpath=//h2[contains(@class, 'page__heading')]    timeout=10s
    Click Element    xpath=//h2[@class='page__heading']



