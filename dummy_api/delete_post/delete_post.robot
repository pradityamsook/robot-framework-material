*** Comments ***
# Deletes a post by ID and verifies the delete flag in the response


*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${BASE_URL}     https://dummyjson.com


*** Test Cases ***
Delete Post
    Create Session    dummy    ${BASE_URL}
    ${response}=    DELETE On Session    dummy    /posts/1
    Status Should Be    200    ${response}
    ${delete_flag}=    Evaluate    json.loads("""${response.content}""")["isDeleted"]    modules=json
    Should Be Equal As Strings    ${delete_flag}    True
    [Teardown]    Delete All Sessions
