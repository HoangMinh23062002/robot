*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://reqres.in/api/users
${requests_options}    Create Dictionary    verify=${True} 
${ENDPOINT}    /users

*** Test Cases ***
TC_001: Verify the status code of the API
     [Documentation]    Sends a GET request to an API and verifies the response status code.
     Create Session    reqres    ${BASE_URL}
     ${response}=    Get Request    reqres    /users?page=2
     Should Be Equal As Strings    ${response.status_code}    200
     Log    Status Code: ${response.text}

TC_002: Put data
    [Documentation]    Posting data to API.
    ${headers}    Create Dictionary    Content-Type=application/json
    ${data}    Create Dictionary    name=John Doe    job=Software Engineer
    ${response}    POST    ${BASE_URL}${ENDPOINT}    json=${data}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    201
    Log    User created successfully!
    Log    Response: ${response.content}
