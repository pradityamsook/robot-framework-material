*** Comments ***
# Get Random Todo and verify the response is not empty


*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${BASE_URL}     https://dummyjson.com


*** Test Cases ***
Get Random Todo
    Create Session    dummy    ${BASE_URL}
    ${response}=    GET On Session    dummy    /todos/random
    Status Should Be    200    ${response}
    ${json}=    Evaluate    json.loads("""${response.content}""")    modules=json
    Should Not Be Empty    ${json}
    [Teardown]    Delete All Sessions
