*** Settings ***
Library           SeleniumLibrary
Variables         Vars/Locator.py
Variables         vars/URL.py
Suite Setup       Setup the Test
Suite Teardown    Close Browser

*** Variables ***
${USERNAME}       standard_user
${PASSWORD}       secret_sauce
${FIRST_NAME}     Tara
${LAST_NAME}      Parsa
${POSTAL_CODE}    12345-456789


*** Test Cases ***
Add Item To Cart And Validate
    [Documentation]    This test case about the validating the shopping cart.
    Login Credential
    Add Item To Cart
    Validate the Cart Item
    Fill Checkout Information
    Validate Order Summary

*** Keywords ***
Setup the Test
    [Documentation]    This keyword is about setting up the browser and ensuring the page is ready.
    Open Browser                           ${Second_url}                chrome
    Maximize Browser Window
    Title Should Be                        ${Second_title}

Login Credential
    [Documentation]    This keyword pertains to logging in using valid credentials.
    Input Text          id:user-name        ${USERNAME}
    Input Text          id:password         ${PASSWORD}
    Click Button        id:login-button
    Wait Until Element Is Visible           ${add_cart}

Add Item To Cart
    [Documentation]    This keyword is about Adding an item to the cart and verifing the cart count.
    Click Element                           ${add_cart}
    ${item_price}=      Get Text            ${invent_price}
    Log                                     Item Price: ${item_price}
    ${cart_count}=      Get Text            ${shop_cart_badge}
    Log                                     Cart Count: ${cart_count}
    Should Be Equal As Numbers              ${cart_count}              1

Validate the Cart Item
    [Documentation]    This keyword is about validating that the correct item is in the cart.
    Click Element                           ${shop_cart_cont}
    ${item_name}=       Get Text            ${invent_name}
    Log                                     Item Name: ${item_name}
    Should Not Be Empty                     ${item_name}
    Click Button                            ${check_btn}
    Wait Until Element Is Visible           ${first_txt}

Fill Checkout Information
    [Documentation]    This keyword is about filling out the checkout information form.
    Input Text          ${first_txt}       ${FIRST_NAME}
    Input Text          ${last_txt}        ${LAST_NAME}
    Input Text          ${postal_txt}      ${POSTAL_CODE}
    Capture Page Screenshot
    Click Button        ${btn_continue}

Validate Order Summary
    [Documentation]    This keyword is about verifying the order summary details.
    ${subtotal}=        Get Text            ${txt_Item_total}
    ${tax}=             Get Text            ${txt_tax }
    ${total}=           Get Text            ${txt_total}
    Log                 Subtotal: ${subtotal}, Tax: ${tax}, Total: ${total}
    Should Contain      ${subtotal}         Item total
    Should Contain      ${tax}              Tax
    Should Contain      ${total}            Total
    # Should Be Equal As Numbers    ${item_price}    ${subtotal}