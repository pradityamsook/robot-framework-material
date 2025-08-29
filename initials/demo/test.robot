*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open Browser And Navigate to Wikipedia
    Open Browser    https://www.wikipedia.org    chrome
    Maximize Browser Window
    Sleep    5s
    Close Browser

Open Browser And Navigate to google
    Open Browser    https://google.com   chrome
    Maximize Browser Window
    Sleep    5s
    Close Browser