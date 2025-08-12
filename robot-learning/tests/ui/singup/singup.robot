*** Settings ***
Library     SeleniumLibrary
Suite Teardown    Close All Browsers


*** Variables ***
${URL}          https://www.demoblaze.com/
${BROWSER}      chrome
${username}     abce1@mail.com
${pass}         Pass1


*** Test Cases ***
Signup acccount successfully
    Open Browser    ${URL}    ${BROWSER}
    Click Element    xpath=//*[@id="signin2"]
    Sleep    5s
    Input Text    xpath=//*[@id="sign-username"]    ${username}  
    Input Text    xpath=//*[@id="sign-password"]    ${pass}
    Sleep    3s
    Click Element    css=body.modal-open > div#signInModal.modal.fade.show > div.modal-dialog > div.modal-content > div.modal-footer > button.btn.btn-primary
    Sleep    5s
    # Wait Until Element Is Visible    xapth=//*[@id="signInModalLabel"]   10s
    # Wait Until Element Is Visible    css=#tbodyid > div.row > div > a    5s
    # Click Element    css=#tbodyid > div.row > div > a
    # Alert Should Be Present    action=Accept
    # Click Element    css=#cartur
    # Wait Until Element Is Visible    css=#page-wrapper > div > div.col-lg-1 > button    5s
    # Click Element    css=#page-wrapper > div > div.col-lg-1 > button
    # Wait Until Element Is Visible    css=#name    5s
    # Input Text    css=#name    John Doe
    # Input Text    css=#country    USA
    # Input Text    css=#city    New York
    # Input Text    css=#card    1234 5678 9012 3456
    # Input Text    css=#month    12
    # Input Text    css=#year    2025
    # Click Element    css=#orderModal > div > div > div.modal-footer > button.btn.btn-primary
    # Wait Until Element Is Visible    css=body > div.sweet-alert.showSweetAlert.visible > h2    5s
    # Element Text Should Be    css=body > div.sweet-alert.showSweetAlert.visible > h2    Thank you for your purchase!
