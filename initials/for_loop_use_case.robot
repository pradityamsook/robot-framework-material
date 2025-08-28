*** Settings ***
Library    SeleniumLibrary

*** Variables ***
@{DATA_INDICES}    Apple    Banana    Orange
@{DATA_DICT}    name=Steve Job    age=999

*** Test Cases ***
Loop list and display log
    FOR     ${data}    IN    @{DATA_INDICES}
        Log To Console    \n Data in list loop is #${data}
    END

Loop Dict and display log
    FOR    ${DATA}    IN    @{DATA_DICT}
        Log To Console    \n Data in dictionary loop is #${DATA}
    END