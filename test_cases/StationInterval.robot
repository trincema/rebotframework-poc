*** Settings ***
Library    RequestsLibrary

*** Keywords ***
Check getInterval
    [Arguments]                    ${url}
    ${headers}=                    Create Dictionary    Content-Type=application/json
    ${payload}=                    Create Dictionary    command=getInterval    payload=null
    ${response}=                   POST    ${url}    json=${payload}    headers=${headers}
    Should Be Equal As Strings     ${response.status_code}    200
    ${json}=    Set Variable       ${response.json()}
    Log To Console                 Response: ${json}
    ${result}=                     Convert To Number    ${json['result']}
    ${is_greater_than_0}=          Evaluate    ${result} > 0
    Should Be True                 ${is_greater_than_0}
    ${is_smaller_than_61}=          Evaluate    ${result} < 61
    Should Be True                 ${is_smaller_than_61}

*** Test Cases ***
Check getInterval Station 1
    Check getInterval    https://api-energy-k8s.test.virtaglobal.com/v1/tests/1
Check getInterval Station 2
    Check getInterval    https://api-energy-k8s.test.virtaglobal.com/v1/tests/2
Check getInterval Station 3
    Check getInterval    https://api-energy-k8s.test.virtaglobal.com/v1/tests/3
Check getInterval Station 4
    Check getInterval    https://api-energy-k8s.test.virtaglobal.com/v1/tests/4
Check getInterval Station 5
    Check getInterval    https://api-energy-k8s.test.virtaglobal.com/v1/tests/5