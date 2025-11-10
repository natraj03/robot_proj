*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Get Users
    ${user_url}    Set Variable    https://reqres.in/api/users/
    ${my_header}    Create Dictionary      x-api-key=reqres-free-v1
    ${user_id}      Set Variable    12
    Create Session   req_ses  ${user_url}
    ${responce}    GET On Session    req_ses   ${user_id}   headers=${my_header}
    Should Be Equal As Integers    ${responce.status_code}    200
    Log     ${responce.text}
    ${json_resp}   To Json    ${responce.text}
    Log    ${json_resp}
    Log    ${json_resp["data"]}
    ${data}     Set Variable     ${json_resp["data"]}
    Should Be Equal As Integers    ${data["id"]}    ${user_id}

Crerate A User
	${user_url}    Set Variable    https://reqres.in/api/
    ${my_header}    Create Dictionary      x-api-key=reqres-free-v1
    ${user_name}      Set Variable    TARA Prasad
    ${post_body}    Create Dictionary       name=${user_name}      job=Developer   email=test@test.com  is_inbangalore=False
	Create Session   req_res_ses  ${user_url}
    ${responce}     POST On Session    req_res_ses   users/   json=${post_body}     headers=${my_header}
    Log     ${responce.text}
    Should Be Equal As Integers    ${responce.status_code}    201
    ${json_resp}   To Json    ${responce.text}
    Should Be Equal As Strings    ${json_resp["name"]}     ${user_name}
    Should Be Equal As Strings    ${json_resp["job"]}     Developer
    Should Be True      ${json_resp["is_inbangalore"]}

