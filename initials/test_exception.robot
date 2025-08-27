*** Settings ***
Library             SeleniumLibrary

Suite Setup         Open Browser To Exception Page
Suite Teardown      Close Browser


*** Variables ***
${URL}          https://practicetestautomation.com/practice-test-exceptions/
${BROWSER}      chrome


*** Test Cases ***
Update Row 1
    Click Button    xpath=//*[@id="edit_btn"]
    Wait Until Element Is Visible    xpath=//*[@id="row1"]/input    timeout=10s
    Clear Element Text    xpath=//*[@id="row1"]/input
    Input Text    xpath=//*[@id="row1"]/input    KFC
    Click Button    xpath=//*[@id="save_btn"]

Add Row 2 And Verify Addition
    Click Button    xpath=//*[@id="add_btn"]
    Wait Until Element Is Visible    xpath=//*[@id="row2"]/input    timeout=10s
    Input Text    xpath=//*[@id="row2"]/input    Burger King

Remove Row 2 And Verify Removal
    Click Button    xpath=//*[@id="remove_btn"]


*** Keywords ***
Open Browser To Exception Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
