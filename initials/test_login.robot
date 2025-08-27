*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${URL}              https://practicetestautomation.com/practice-test-login/
${BROWSER}          chrome
${VALID USER}       student
${VALID PASS}       Password123
${INVALID USER}     wronguser
${INVALID PASS}     wrongpass


*** Test Cases ***
Login With Valid Credentials
    Open Browser    ${URL}    ${BROWSER}
    Input Text    xpath=//*[@id="username"]    ${VALID USER}
    Input Text    xpath=//*[@id="password"]    ${VALID PASS}
    Click Button    xpath=//*[@id="submit"]
    Wait Until Page Contains    Logged In Successfully
    Close Browser

Login With Invalid Username
    Open Browser    ${URL}    ${BROWSER}
    Input Text    xpath=//*[@id="username"]    ${INVALID USER}
    Input Text    xpath=//*[@id="password"]    ${VALID PASS}
    Click Button    xpath=//*[@id="submit"]
    Wait Until Page Contains    Your username is invalid!
    Close Browser

Login With Invalid Password
    Open Browser    ${URL}    ${BROWSER}
    Input Text    xpath=//*[@id="username"]    ${VALID USER}
    Input Text    xpath=//*[@id="password"]    ${INVALID PASS}
    Click Button    xpath=//*[@id="submit"]
    Wait Until Page Contains    Your password is invalid!
    Close Browser

Login With Invalid Username and Password
    Open Browser    ${URL}    ${BROWSER}
    Input Text    xpath=//*[@id="username"]    ${INVALID USER}
    Input Text    xpath=//*[@id="password"]    ${INVALID PASS}
    Click Button    xpath=//*[@id="submit"]
    Wait Until Page Contains    Your username is invalid!
    Close Browser
