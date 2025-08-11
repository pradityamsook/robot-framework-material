*** Comments ***
# pip install robotframework-databaselibrary


*** Settings ***
Library     DatabaseLibrary
Library     OperatingSystem


*** Variables ***
${DBPATH}       ${CURDIR}/../db/demo.db
${DBNAME}       demo


*** Test Cases ***
Connect To SQLite And Select Data
    Connect To Database    sqlite3    ${DBPATH}
    @{results}=    Query    SELECT name, email FROM users WHERE name='John'
    Should Be Equal    ${results[0][0]}    John
    Should Be Equal    ${results[0][1]}    john@email.com
    [Teardown]    Disconnect From Database

Insert New User And Validate
    Connect To Database    sqlite3    ${DBPATH}
    Execute Sql String    INSERT INTO users (name, email) VALUES ('David', 'david@email.com')
    @{new_user}=    Query    SELECT * FROM users WHERE name='David'
    Should Be Equal    ${new_user[0][1]}    David
    Should Be Equal    ${new_user[0][2]}    david@email.com
    [Teardown]    Cleanup Inserted User


*** Keywords ***
Cleanup Inserted User
    Execute Sql String    DELETE FROM users WHERE name='David' AND email='david@email.com'
    Disconnect From Database
