*** Settings ***
Library    RequestsLibrary

*** Keywords ***
Check getVersion
    [Arguments]                    ${url}
    ${headers}=                    Create Dictionary    Content-Type=application/json
    ${payload}=                    Create Dictionary    command=getVersion    payload=null
    ${response}=                   POST    ${url}    json=${payload}    headers=${headers}
    Should Be Equal As Strings     ${response.status_code}    200
    ${json}=    Set Variable       ${response.json()}
    Log To Console                 Response: ${json}
    ${result}=                     Convert To Number    ${json['result']}
    ${is_greater_than_1_6}=        Evaluate    ${result} > 1.6
    Should Be True                 ${is_greater_than_1_6}

*** Test Cases ***
Check getVersion Station 1
    Check getVersion    https://api-energy-k8s.test.virtaglobal.com/v1/tests/1
Check getVersion Station 2
    Check getVersion    https://api-energy-k8s.test.virtaglobal.com/v1/tests/2
Check getVersion Station 3
    Check getVersion    https://api-energy-k8s.test.virtaglobal.com/v1/tests/3
Check getVersion Station 4
    Check getVersion    https://api-energy-k8s.test.virtaglobal.com/v1/tests/4
Check getVersion Station 5
    Check getVersion    https://api-energy-k8s.test.virtaglobal.com/v1/tests/5