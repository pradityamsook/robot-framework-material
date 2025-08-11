*** Settings ***
Library     SeleniumLibrary
Suite Teardown    Close All Browsers


*** Variables ***
${URL}          https://www.demoblaze.com/
${BROWSER}      chrome


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
