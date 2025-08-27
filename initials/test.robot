*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open Browser And Navigate to Wikipedia
    Open Browser    https://www.wikipedia.org    chrome
    Maximize Browser Window
    Sleep    3s
    Close Browser