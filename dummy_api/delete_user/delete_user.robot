*** Comments ***
# Deletes a user by ID


*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${BASE_URL}     https://dummyjson.com


*** Test Cases ***
Delete User
    Create Session    dummy    ${BASE_URL}
    ${user_response}=   GET On Session    dummy    /users
    Status Should Be    200    ${user_response}
    ${last_user_id}=    Evaluate    json.loads("""${user_response.content}""")["users"][-1]["id"]    modules=json
    ${response}=    DELETE On Session    dummy    /users/${last_user_id}
    Status Should Be    200    ${response}
    ${delete_flag}=    Evaluate    json.loads("""${response.content}""")["isDeleted"]    modules=json
    Should Be Equal As Strings    ${delete_flag}    True
    [Teardown]    Delete All Sessions
