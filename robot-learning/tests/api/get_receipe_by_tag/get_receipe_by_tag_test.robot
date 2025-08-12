*** Comments ***
# Get Recipe By Tag and verify the response is not empty


*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${BASE_URL}         https://dummyjson.com
${RECIPE_TAG}       Indian


*** Test Cases ***
Get Receipe By Tag
    Create Session    dummy    ${BASE_URL}
    ${response}=    GET On Session    dummy    /recipes/tag/${RECIPE_TAG}
    Status Should Be    200    ${response}
    ${recipes}=    Evaluate    json.loads("""${response.content}""")["recipes"]    modules=json
    Should Not Be Empty    ${recipes}
    [Teardown]    Delete All Sessions
