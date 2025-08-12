*** Comments ***
# Get Product Categories


*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${BASE_URL}     https://dummyjson.com


*** Test Cases ***
Get Product Categories
    Create Session    dummy    ${BASE_URL}
    ${response}=    GET On Session    dummy    /products/categories
    Status Should Be    200    ${response}
    ${categories}=    Evaluate    json.loads("""${response.content}""")[0]    modules=json
    Should Not Be Empty    ${categories}
    [Teardown]    Delete All Sessions
