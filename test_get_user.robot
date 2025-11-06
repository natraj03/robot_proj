*** Settings ***
Library    RequestsLibrary


*** Variables ***
${BASE_URL}    https://reqres.in/api/
${API_KEY}     reqres-free-v1


*** Test Cases ***
Fetch User Details
	Create Session    reqres    ${BASE_URL}
    ${headers}=    Create Dictionary    x-api-key=${API_KEY}
    ${response}=    GET On Session    reqres    /users/1    headers=${headers}
    Log    Status: ${response.status_code}
    Log    Body: ${response.text}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    To JSON    ${response.text}
    Log    ${json["data"]}




