*** Settings ***
Library    RequestsLibrary


*** Variables ***
${BASE_URL}    https://reqres.in    
&{HEADERS}    x-api-key=reqres_64c48ef3e0ba45c4884f4738d283ec8f

*** Test Cases ***
Get User Success
    Create Session    reqres    ${BASE_URL}    headers=${HEADERS}

    ${response}=    GET On Session    reqres    /api/users/12
    Should Be Equal As Integers    ${response.status_code}    200

    ${data}=    Set Variable    ${response.json()['data']}
    Should Be Equal As Integers    ${data['id']}    12
    Should Be Equal    ${data['email']}    rachel.howell@reqres.in
    Should Be Equal    ${data['first_name']}    Rachel
    Should Be Equal    ${data['last_name']}     Howell
    Should Be Equal    ${data['avatar']}    https://reqres.in/img/faces/12-image.jpg


Get user profile but user not found
    Create Session    reqres    ${BASE_URL}    headers=${HEADERS}
    ${response}=    GET On Session    reqres    /api/users/1234    expected_status=404
    Should Be Equal As Integers    ${response.status_code}    404
    Should Be Equal    ${response.text}    {}

    
