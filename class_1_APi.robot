*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Get Users
    ${user_url}    Set Variable    https://reqres.in/api/users/
    ${my_header}    Create Dictionary      x-api-key=reqres-free-v1
    ${user_id}      Set Variable    1
    Create Session   req_ses  ${user_url}
    ${responce}    GET On Session    req_ses   ${user_id}   headers=${my_header}
    Should Be Equal As Integers    ${responce.status_code}    200
    Log     ${responce.text}
    ${json_resp}   To Json    ${responce.text}
    Log    ${json_resp}
    Log    ${json_resp["data"]}
    ${data}     Set Variable     ${json_resp["data"]}
    Should Be Equal As Integers    ${data["id"]}    ${user_id}


