*** Comments ***
# Update a post's title by ID


*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${BASE_URL}     https://dummyjson.com
${TITLE}        Test Title


*** Test Cases ***
Update Post
    Create Session    dummy    ${BASE_URL}
    &{update_data}=    Create Dictionary    title=${TITLE}
    ${response}=    PATCH On Session    dummy    /posts/1    json=${update_data}
    Status Should Be    200    ${response}
    ${updated_title}=    Evaluate    json.loads("""${response.content}""")["title"]    modules=json
    Should Be Equal As Strings    ${updated_title}    ${TITLE}
    [Teardown]    Delete All Sessions
