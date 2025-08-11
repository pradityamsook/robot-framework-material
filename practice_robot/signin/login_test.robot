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
Valid Login Should Succeed
    Open Browser    ${URL}    ${BROWSER}
    Click Element    xpath=//*[@id="login2"]
    Wait Until Element Is Visible    xpath=//*[@id="logInModal"]    5s
    Input Text    xpath=//*[@id="loginusername"]    ${username}  
    Input Text    xpath=//*[@id="loginpassword"]    ${pass}
    Click Element    css=body.modal-open > div#logInModal.modal.fade.show > div.modal-dialog > div.modal-content > div.modal-footer > button.btn-primary
    Wait Until Element Is Visible    xpath=//*[@id="nameofuser"]    3s
    Page Should Contain Element    xpath=//*[@id="nameofuser"]

# Valid Logout Should be Succeed
#     ${get_name_user}=    Get Text    xpath=//*[@id="nameofuser"]
#     IF    '${get_name_user} == ${welcome_user}'
#         Click Element    xpath=//*[@id="logout2"]
#     END

Valid List Categories
    ${elements_cate}=    Get WebElements    css=body > div#contcount.container > div.row > div.col-lg-3 > div.list-group
    Log    Element categories: ${elements_cate}
    FOR    ${element}    IN    @{elements_cate}
        Log    Found: ${element}
        Click Element    ${element}
        Sleep    5s
    END  