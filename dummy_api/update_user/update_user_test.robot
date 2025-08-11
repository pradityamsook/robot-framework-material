*** Comments ***
# This test case updates a user's last name using the PATCH method by user id.


*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${BASE_URL}     https://dummyjson.com
${last_name}    Doe


*** Test Cases ***
Update User
    Create Session    dummy    ${BASE_URL}
    &{update_data}=    Create Dictionary    lastName=${last_name}
    ${response}=    PATCH On Session    dummy    /users/1    json=${update_data}
    Status Should Be    200    ${response}
    ${updated_last_name}=    Evaluate    json.loads("""${response.content}""")["lastName"]    modules=json
    Should Be Equal    ${updated_last_name}    ${last_name}
    [Teardown]    Delete All Sessions
