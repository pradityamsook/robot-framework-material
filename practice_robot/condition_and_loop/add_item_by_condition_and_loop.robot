*** Settings ***
Library     SeleniumLibrary
Library     Collections
Suite Teardown    Close All Browsers


*** Variables ***
${URL}          https://www.demoblaze.com/
${BROWSER}      chrome
@{PRODUCT INDICES}    1    2    3


*** Test Cases ***
Add to cart and buy successfully
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Element Is Visible    css=#tbodyid > div:nth-child(1) > div > div > h4 > a    5s
    Click Element    css=#tbodyid > div:nth-child(1) > div > div > h4 > a
    Wait Until Element Is Visible    css=#tbodyid > div.row > div > a    5s
    Click Element    css=#tbodyid > div.row > div > a
    Alert Should Be Present    action=Accept
    Click Element    css=#cartur
    Wait Until Element Is Visible    css=#page-wrapper > div > div.col-lg-1 > button    5s
    Click Element    css=#page-wrapper > div > div.col-lg-1 > button
    Wait Until Element Is Visible    css=#name    5s
    Input Text    css=#name    John Doe
    Input Text    css=#country    USA
    Input Text    css=#city    New York
    Input Text    css=#card    1234 5678 9012 3456
    Input Text    css=#month    12
    Input Text    css=#year    2025
    Click Element    css=#orderModal > div > div > div.modal-footer > button.btn.btn-primary
    Wait Until Element Is Visible    css=body > div.sweet-alert.showSweetAlert.visible > h2    5s
    Element Text Should Be    css=body > div.sweet-alert.showSweetAlert.visible > h2    Thank you for your purchase!

Add Multiple Items To Cart
    Open Browser    ${URL}    ${BROWSER}
    FOR    ${index}    IN    @{PRODUCT INDICES}
        Wait Until Element Is Visible    css=#tbodyid > div:nth-child(${index}) > div > div > h4 > a    5s
        Click Element    css=#tbodyid > div:nth-child(${index}) > div > div > h4 > a
        Wait Until Element Is Visible    css=#tbodyid > div.row > div > a    5s
        Click Element    css=#tbodyid > div.row > div > a
        Alert Should Be Present    action=Accept
        Go To    ${URL}
    END

Add Until Cart Has Three Items
    Open Browser    ${URL}    ${BROWSER}
    ${count}=    Set Variable    0
    WHILE    ${count} < 3
        ${index}=    Evaluate    ${count} + 1
        Wait Until Element Is Visible    css=#tbodyid > div:nth-child(${index}) > div > div > h4 > a    5s
        Click Element    css=#tbodyid > div:nth-child(${index}) > div > div > h4 > a
        Wait Until Element Is Visible    css=#tbodyid > div.row > div > a    5s
        Click Element    css=#tbodyid > div.row > div > a
        Alert Should Be Present    action=Accept
        Go To    ${URL}
        ${count}=    Evaluate    ${count} + 1
    END

Buy Expensive Things Only
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Element Is Visible    css=#tbodyid > div:nth-child(2) > div > div > h4 > a    5s
    Click Element    css=#tbodyid > div:nth-child(2) > div > div > h4 > a
    Wait Until Element Is Visible    css=.price-container    5s
    ${price_text}=    Get Text    css=.price-container
    ${price_clean}=    Evaluate    re.sub(r'[^0-9]', '', """${price_text}""")    re
    ${price}=    Evaluate    int(${price_clean})

    IF    ${price} > 500
        Click Element    css=#tbodyid > div.row > div > a
        Alert Should Be Present    action=Accept
        Log    Purchased because price was ${price}
    ELSE
        Log    Skipping purchase; price ${price} is not high enough
    END

Buy Expensive Things Only All Pages
    Open Browser    ${URL}    ${BROWSER}

    WHILE    True
        Wait Until Element Is Visible   css=#tbodyid > div > div > div > h4 > a    5s
        
        ${count}=    Get Element Count    css=#tbodyid > div > div > div > h4 > a
        Log    Found ${count} items on the page
        
        FOR    ${index}    IN RANGE    ${count}
            ${items}=    Get WebElements    css=#tbodyid > div > div > div > h4 > a
            ${item}=    Get From List    ${items}    ${index}

            Wait Until Element Is Visible    ${item}    5s
            Click Element    ${item}
            Wait Until Element Is Visible    css=.price-container    5s

            ${price_text}=    Get Text    css=.price-container
            ${price_clean}=    Evaluate    re.sub(r'[^0-9]', '', """${price_text}""")    re
            ${price}=    Evaluate    int(${price_clean})

            IF    ${price} > 500
                Wait Until Element Is Visible    css=#tbodyid > div.row > div > a    5s
                Click Element    css=#tbodyid > div.row > div > a
                Alert Should Be Present    action=ACCEPT
                Log    Purchased because price was ${price}
                Go Back
                Go Back
            ELSE
                Log    Skipping purchase; price ${price} is not high enough
                Go Back
            END
            Wait Until Element Is Visible   css=#tbodyid > div > div > div > h4 > a    5s
        END

        ${next_exists}=    Run Keyword And Return Status    Element Should Be Visible    css=#next2    3s
        IF    ${next_exists}
            Click Element    css=#next2
            Sleep    2s
            Wait Until Element Is Visible    css=#tbodyid > div > div > div > h4 > a    5s
        ELSE
            BREAK
        END
    END




