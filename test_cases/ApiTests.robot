*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Send POST Request with JSON Body
    ${url}=    Set Variable    https://api-energy-k8s.test.virtaglobal.com/v1/tests/1
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${payload}=    Create Dictionary    command=getVersion    payload=null
    ${response}=    POST    ${url}    json=${payload}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    ${json}=    Set Variable    ${response.json()}
    Log To Console    Response: ${json}
    Should Be Equal    ${json['result']}    1.5