*** Settings ***
Library           SeleniumLibrary
Variables         Vars/Locator.py
Variables         vars/URL.py
Suite Setup       Setup the Test
Suite Teardown    Close Browser

*** Test Cases ***
Select the Search Button and Verify this
    [Documentation]           TC for Select the Search Button in this Website.
    Select the Search Button
    Verify the Search Button 

*** Keywords ***
Setup the Test
   Open Browser    ${Site_url}    chrome
   Maximize Browser Window
   Title Should Be    ${web_title}

Select the Search Button
    [Documentation]    Click on the Search Button
    Wait Until Element Is Visible    ${Search_btn}    timeout=10
    Click Element    ${Search_btn}
    Wait Until Element Is Visible  ${Search_input}    timeout=10

Verify the Search Button 
    [Documentation]    Verify the Search Button Loaded
    Page Should Contain Element    ${Search_input}
    ${get_name}=    Get Element Attribute    ${Search_input}    name
    Should Be Equal    ${get_name}    s


