*** Settings ***
Library    RequestsLibrary

*** Keywords ***
Check getVersion
    [Arguments]                    ${url}    ${payload}
    ${headers}=                    Create Dictionary    Content-Type=application/json
    ${payload}=                    Create Dictionary    command=getVersion    payload=${payload}
    ${response}=                   POST    ${url}    json=${payload}    headers=${headers}
    Should Be Equal As Strings     ${response.status_code}    200
    ${json}=    Set Variable       ${response.json()}
    Log To Console                 Response: ${json}
    ${result}=                     Convert To Number    ${json['result']}
    ${is_greater_than_1_6}=        Evaluate    ${result} > 1.6
    Should Be True                 ${is_greater_than_1_6}

*** Test Cases ***
GetVersion Station 1
    Check getVersion    https://api-energy-k8s.test.virtaglobal.com/v1/tests/1    null
GetVersion Station 2
    Check getVersion    https://api-energy-k8s.test.virtaglobal.com/v1/tests/2    1
GetVersion Station 3
    Check getVersion    https://api-energy-k8s.test.virtaglobal.com/v1/tests/3    100
GetVersion Station 4
    Check getVersion    https://api-energy-k8s.test.virtaglobal.com/v1/tests/4    null
GetVersion Station 5
    Check getVersion    https://api-energy-k8s.test.virtaglobal.com/v1/tests/5    null