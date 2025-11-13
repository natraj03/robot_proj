*** Settings ***
Resource    ../../configs/api_variables.robot
Library    RequestsLibrary


*** Test Cases ***
Get User
    ${user_id}    Set Variable    3
    Create Session     req_res    ${base_url}
    ${responce}  GET On Session    req_res   ${users}/${user_id}    headers=${base_header}
    Should Be Equal As Integers    ${responce.status_code}    200
    Log     ${responce.text}
    ${json_resp}   To Json    ${responce.text}
    Log    ${json_resp}
    Log    ${json_resp["data"]}
    ${data}     Set Variable     ${json_resp["data"]}
    Should Be Equal As Integers    ${data["id"]}    ${user_id}