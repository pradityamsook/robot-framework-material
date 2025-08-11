*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${URL}                  https://demoblaze.com/
${BROWSER}      chrome
${username}     abce1@mail.com
${pass}         Pass1
${welcome_user}    Welcome abce1@mail.com
${categories_user}    Phones    Laptops    Monitors



*** Test Cases ***
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
 