*** Comments ***
# Get user data, extract username and password, and login to the system.


*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${BASE_URL}     https://dummyjson.com


*** Test Cases ***
Login User
    Create Session    dummy    ${BASE_URL}
    ${user_response}=    GET On Session    dummy    /users?limit\=1
    Status Should Be    200    ${user_response}
    ${username}=    Evaluate    json.loads("""${user_response.content}""")["users"][0]["username"]    modules=json
    ${password}=    Evaluate    json.loads("""${user_response.content}""")["users"][0]["password"]    modules=json
    &{login_data}=    Create Dictionary    username=${username}    password=${password}
    ${login_response}=    POST On Session    dummy    /user/login    json=${login_data}
    Status Should Be    200    ${login_response}
    ${login_json}=    Evaluate    json.loads("""${login_response.content}""")    modules=json
    Dictionary Should Contain Key    ${login_json}    accessToken
    [Teardown]    Delete All Sessions
