*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}        https://demoblaze.com
${username}    pradityam
${password}    123456

*** Test Cases ***
Sign in demoblaze.com
    Open Browser    ${url}    ${browser}    
    Maximize Browser Window
    Click Element    css=#login2
    Sleep    5s
    Wait Until Element Visible    css=#logInModal > div > div > div.modal-header
    Input Text    css=#loginusername    ${username}
    Input Text    ...
    Click Button    ...
    Alert Should Be Present
    Close Browser

    