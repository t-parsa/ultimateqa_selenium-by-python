*** Settings ***
Library           SeleniumLibrary
Variables         Vars/Locator.py
Variables         vars/URL.py
Suite Setup       Setup the Test
Suite Teardown    Close Browser

*** Test Cases ***
Select the Free Course and Go to the Sign In Page
    [Documentation]           TC for Signing In to the Website.
    Free Course Selection
    Go to the Sign In Page

*** Keywords ***
Setup the Test
   Open Browser    ${Site_url}    chrome
   Maximize Browser Window
   Title Should Be    ${web_title}
.
    [Documentation]           Logic to selecting the Free Course.
    Select Free Courses Menu Item

Select Free Courses Menu Item
    [Documentation]           Click on the Free Courses item and Verify Free Courses Page Loaded
    Wait Until Element Is Visible    ${Education}    timeout=5s
    Mouse Over    ${Education}
    Wait Until Element Is Visible    ${Free_Courses}    timeout=5s
    Click Element    ${Free_Courses} 
    Wait Until Element Contains    ${Product}    Products
    Wait Until Element Is Visible    ${SignIn}    timeout=5s

Go to the Sign In Page
  [Documentation]           Verify that the Sign In page loaded successfully.
    Mouse Over    ${SignIn} 
    Wait Until Page Contains         Sign In
    Click Element    ${SignIn}                 
    Wait Until Element Is Visible    ${SignIn_Text}



