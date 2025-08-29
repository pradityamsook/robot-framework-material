*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Find text is PRODUCT STORE
    Open Browser    https://demoblaze.com    chrome
    Maximize Browser Window
    Page Should Contain    ...
    Sleep    5s
    Close Browser

    Alert Should Be Present