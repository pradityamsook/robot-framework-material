*** Comments ***
# pip install robotframework-requests


*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${BASE_URL}     https://jsonplaceholder.typicode.com


*** Test Cases ***
Get Post By ID
    Create Session    jsonplaceholder    ${BASE_URL}
    ${response}=    GET On Session    jsonplaceholder    /posts/1
    Should Be Equal As Numbers    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    title

Create New Post
    Create Session    jsonplaceholder    ${BASE_URL}
    ${data}=    Create Dictionary    title=Test    body=ROBOT    description=API_TEST
    ${response}=    POST On Session    jsonplaceholder    /posts    json=${data}
    Should Be Equal As Numbers    ${response.status_code}    201
    Dictionary Should Contain Key    ${response.json()}    description
