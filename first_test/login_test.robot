*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${URL}                  https://practicetestautomation.com/practice-test-login/
${URL_PRACITCE}         https://practicetestautomation.com/practice-test-exceptions/
${BROWSER}              chrome
${VALID_USERNAME}       student
${VALID_PASSWORD}       Password123
${INVALID_USERNAME}     wronguser
${INVALID_PASSWORD}     wrongpass


*** Test Cases ***

# Count element ID
#     Open Browser    ${URL}    ${BROWSER}
#     ${count}=    Get Element Count    css:#username
#     Log    Number of elements with ID 'username': ${count}
#     Close Browser

Search wording
    Open Browser    ${URL_PRACITCE}    ${BROWSER}
    Element Should Contain    xpath=//*[@id="food_list"]    NoSuchElementException
    Page Should Contain    NoSuchElementException
    Close Browser

# Valid Login Should Succeed
#     Open Browser    ${URL}    ${BROWSER}
#     Wait Until Element Is Visible    xpath=//*[@id="username"]    5s
#     Input Text    xpath=//*[@id="username"]    ${VALID_USERNAME}
#     Input Text    xpath=//*[@id="password"]    ${VALID_PASSWORD}
#     Click Button    xpath=//*[@id="submit"]
#     Wait Until Element Is Visible    xpath=//*[@id="loop-container"]/div/article/div[1]/h1    5s
#     Element Text Should Be    xpath=//*[@id="loop-container"]/div/article/div[1]/h1    Logged In Successfully
#     Close Browser

# Invalid Username Should Show Error
#     Open Browser    ${URL}    ${BROWSER}
#     Wait Until Element Is Visible    xpath=//*[@id="username"]    5s
#     Input Text    xpath=//*[@id="username"]    ${INVALID_USERNAME}
#     Input Text    xpath=//*[@id="password"]    ${VALID_PASSWORD}
#     Click Button    xpath=//*[@id="submit"]
#     Wait Until Element Is Visible    xpath=//*[@id="error"]    5s
#     Element Text Should Be    xpath=//*[@id="error"]    Your username is invalid!
#     Close Browser

# Invalid Password Should Show Error
#     Open Browser    ${URL}    ${BROWSER}
#     Wait Until Element Is Visible    xpath=//*[@id="username"]    5s
#     Input Text    xpath=//*[@id="username"]    ${VALID_USERNAME}
#     Input Text    xpath=//*[@id="password"]    ${INVALID_PASSWORD}
#     Click Button    xpath=//*[@id="submit"]
#     Wait Until Element Is Visible    xpath=//*[@id="error"]    5s
#     Element Text Should Be    xpath=//*[@id="error"]    Your password is invalid!
#     Close Browser