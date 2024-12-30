*** Settings ***
Library           SeleniumLibrary
Variables         Vars/Locator.py
Variables         vars/URL.py
Resource          Homework_01_LogintoWebsite.robot       
Suite Teardown    Close Browser

*** Variables ***
${URL}           https://www.saucedemo.com/
${BROWSER}       chrome
${USERNAME}      standard_user
${PASSWORD}      secret_sauce

*** Test Cases ***
Login To Sauce Demo
    Open Browser                                ${URL}                        ${BROWSER}
    Maximize Browser Window
    Login To Sauce Demo                         ${USERNAME}                   ${PASSWORD}

Select the Filter and Verify this
    [Documentation]           TC for Select the Filter and Verify them in this Website.
    [Setup]    Login To Sauce Demo              ${USERNAME}                  ${PASSWORD}
    Select the Filter
    Verify the Filter

*** Keywords ***
Select the Filter
    Select From List By Value                   ${Filter_set}                 za

Verify the Filter
    ${product_prices}=    Get Elements Text    xpath=//div[@class='inventory_item_price']
    # :FOR    ${price}    IN    @{product_prices}
    # \    Log    ${price}
    # ${sorted_prices}=    Create List    ${product_prices}
    # ${sorted_prices}=    Sort List    ${sorted_prices}
    # Should Be Equal As Lists    ${product_prices}    ${sorted_prices}


