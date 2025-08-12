*** Comments ***
# Adds a recipe and verifies the response is not empty


*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${BASE_URL}     https://dummyjson.com
${NAME}         Test Recipe


*** Test Cases ***
Add Recipe
    Create Session    dummy    ${BASE_URL}
    ${data}=    Create Dictionary    name=${NAME}
    ${response}=    POST On Session    dummy    /recipes/add    json=${data}
    Status Should Be    200    ${response}
    ${json}=    Evaluate    json.loads("""${response.content}""")    modules=json
    Should Not Be Empty    ${json}
    [Teardown]    Delete All Sessions
