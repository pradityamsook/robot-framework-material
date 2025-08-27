*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}             https://www.demoblaze.com/
${BROWSER}         Chrome
${USERNAME}        testuser123
${PASSWORD}        123456

*** Keywords ***
Open Demoblaze
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    PRODUCT STORE

Close Demoblaze
    Close Browser

Login
    Click Element    id=login2
    Wait Until Element Is Visible    id=loginusername
    Input Text    id=loginusername    ${USERNAME}
    Input Text    id=loginpassword    ${PASSWORD}
    Click Button    xpath=//button[text()="Log in"]
    Wait Until Page Contains    Welcome ${USERNAME}

Logout
    Click Element    id=logout2
    Wait Until Element Is Visible    id=login2
