*** Settings ***
Library     SeleniumLibrary
# Resource    ../resources/login.resource

Suite Setup    Open Browser    ${URL}    ${BROWSER}
Suite Teardown    Close Browser


*** Variables ***
${URL}                  https://demoblaze.com/
${BROWSER}      chrome
${username}     abce1@mail.com
${pass}         Pass1
${welcome_user}    Welcome abce1@mail.com
${categories_user}    Phones    Laptops    Monitors


*** Test Cases ***
Valid Login Should Succeed
    Open Browser    ${URL}    ${BROWSER}
    Click Element    css=#login2
    Wait Until Element Is Visible    xpath=//*[@id="logInModal"]
    Input Text    xpath=//*[@id="loginusername"]    ${username}  
    Wait Until Element Is Visible    xpath=//*[@id="loginpassword"]
    Input Text    xpath=//*[@id="loginpassword"]    ${pass}
    Click Element    css=#logInModal > div > div > div.modal-footer > button.btn.btn-primary
    Wait Until Element Is Visible    xpath=//*[@id="nameofuser"]
    Page Should Contain Element    xpath=//*[@id="nameofuser"]

Valid Logout Should be Succeed
    ${get_name_user}=    Get Text    xpath=//*[@id="nameofuser"]
    IF    '${get_name_user} == ${welcome_user}'
        Click Element    xpath=//*[@id="logout2"]
    END