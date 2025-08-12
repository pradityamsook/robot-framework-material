*** Comments ***
# Get Post By User ID and verify the userId in the response


*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${BASE_URL}     https://dummyjson.com
${ID}           1


*** Test Cases ***
Get Post By User ID
    Create Session    dummy    ${BASE_URL}
    ${response}=    GET On Session    dummy    /posts/user/${ID}
    Status Should Be    200    ${response}
    ${user_id}=    Evaluate    json.loads("""${response.content}""")["posts"][0]["userId"]    modules=json
    Should Be Equal As Strings    ${user_id}    ${ID}
    [Teardown]    Delete All Sessions
