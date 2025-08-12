*** Comments ***
# Updates a comment's body by ID


*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${BASE_URL}     https://dummyjson.com
${BODY}         Oi!! This is a test comment


*** Test Cases ***
Update Comment
    Create Session    dummy    ${BASE_URL}
    &{update_data}=    Create Dictionary    body=${BODY}
    ${response}=    PATCH On Session    dummy    /comments/1    json=${update_data}
    Status Should Be    200    ${response}
    ${updated_body}=    Evaluate    json.loads("""${response.content}""")["body"]    modules=json
    Should Be Equal As Strings    ${updated_body}    ${BODY}
    [Teardown]    Delete All Sessions
