*** Settings ***
Library           SeleniumLibrary
Library           myenv/lib/python3.9/site-packages/robot/libraries/Collections.py
Variables         Vars/Locator.py
Variables         vars/URL.py

*** Variables ***
${USERNAME}                              standard_user
${PASSWORD}                              secret_sauce
${FILTER_OPTION}                         Price (low to high)

*** Test Cases ***
Verify Product Filter Functionality
    Setup the Test
    Login Credential
    Select the Filter
    Verify the Filter
    # Close Browser

*** Keywords ***
Setup the Test
    Open Browser               ${Second_url}                chrome
    Maximize Browser Window
    Title Should Be            ${Second_title}

Login Credential
    [Documentation]    Logs in to the website with valid credentials.
    Input Text        id=user-name              ${USERNAME}
    Input Text        id=password               ${PASSWORD}
    Click Button      id=login-button
    Wait Until Element Is Visible               ${Filter_set}  
    # Click Button    ${btn_id}

Select the Filter
    Select From List By Value                   ${Filter_set}                 hilo
    Wait Until Element Contains                 ${Filter_set}                 Price (high to low)
    Capture Page Screenshot
 
# Verify the Filter
#     [Documentation]    Verifies that products are sorted according to the applied filter.
#     Wait Until Element Is Visible               css:.inventory_item_price    10s
#     ${prices}=    Get WebElements               css:.inventory_item_price 
#     Log List       ${prices}
#     ${price_list}=    Evaluate         [float(price.text.replace('$', '')) for price in ${prices} if price.text.strip()]
#     Log List       ${price_list}
#     ${sorted_list}=    Evaluate        sorted(${price_list}, reverse=True)
#     Should Be Equal As Numbers        ${price_list}        ${sorted_list}

Verify the Filter
    [Documentation]    Verifies that products are sorted according to the applied filter.
    ${prices}=    Get WebElements      css:.price-class
    Log List       ${prices}

    # Extract text from each web element
    ${price_texts}=    Evaluate         [price.text for price in ${prices}]
    Log List       ${price_texts}

    # Remove empty or invalid text and convert to float
    ${price_list}=    Evaluate         [float(price.text.replace('$', '')) for price in ${prices} if price.text.strip()]  modules=BuiltIn
    Log List       ${price_list}

    # Sort and compare
    ${sorted_list}=    Evaluate        sorted(${price_list}, reverse=True)
    Should Be Equal As Numbers        ${price_list}        ${sorted_list}