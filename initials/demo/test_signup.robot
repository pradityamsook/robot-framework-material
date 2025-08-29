*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}        https://demoblaze.com
${username}

*** Test Cases ***
Find text is PRODUCT STORE
    Open Browser    ${url}    ${browser}    
    Maximize Browser Window
    Click Element    css=#signin2
    Sleep    5s
    Wait Until Element Visible    css=#signInModal > div > div > div.modal-body > form > div:nth-child(1)
    Input Text    css=#sign-username    ${username}
    Input Text    ...
    Click Button    ...
    Alert Should Be Present
    Close Browser

    