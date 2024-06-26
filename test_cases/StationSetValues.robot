*** Settings ***
Library    RequestsLibrary

*** Keywords ***
Check setValues
    [Arguments]                    ${url}        ${n}        ${status}
    ${headers}=                    Create Dictionary    Content-Type=application/json
    ${payload}=                    Create Dictionary    command=setValues    payload=${n}
    ${response}=                   POST    ${url}    json=${payload}    headers=${headers}
    Should Be Equal As Strings     ${response.status_code}    200
    ${json}=    Set Variable       ${response.json()}
    Log To Console                 Response: ${json}
    Should Be Equal As Strings     ${json['result']}    ${status}

*** Test Cases ***
SetValues Station 1 n=0
    Log  Check setValues Station 1 Invalid Partition 1 High Boundary
    Check setValues    https://api-energy-k8s.test.virtaglobal.com/v1/tests/1    0        FAILED
SetValues Station 1 n=1
    Log  Check setValues Station 1 Valid Partition 2 Low Boundary
    Check setValues    https://api-energy-k8s.test.virtaglobal.com/v1/tests/1    1        OK
SetValues Station 1 n=10
    Log  Check setValues Station 1 Valid Partition 2 High Boundary
    Check setValues    https://api-energy-k8s.test.virtaglobal.com/v1/tests/1    10       OK
SetValues Station 1 n=11
    Log  Check setValues Station 1 Invalid Partition 3 Low Boundary
    Check setValues    https://api-energy-k8s.test.virtaglobal.com/v1/tests/1    11       FAILED

SetValues Station 2 n=0
    Log  Check setValues Station 2 Valid Partition Low Boundary
    Check setValues    https://api-energy-k8s.test.virtaglobal.com/v1/tests/2    0        FAILED
SetValues Station 2 n=1
    Log  Check setValues Station 2 Valid Partition Low Boundary
    Check setValues    https://api-energy-k8s.test.virtaglobal.com/v1/tests/2    1        OK
SetValues Station 2 n=10
    Log  Check setValues Station 2 Valid Partition High Boundary
    Check setValues    https://api-energy-k8s.test.virtaglobal.com/v1/tests/2    10       OK
SetValues Station 2 n=11
    Log  Check setValues Station 2 Invalid Partition Low Boundary
    Check setValues    https://api-energy-k8s.test.virtaglobal.com/v1/tests/2    11       FAILED

SetValues Station 3 n=0
    Log  Check setValues Station 3 Valid Partition Low Boundary
    Check setValues    https://api-energy-k8s.test.virtaglobal.com/v1/tests/3    0        FAILED
SetValues Station 3 n=1
    Log  Check setValues Station 3 Valid Partition Low Boundary
    Check setValues    https://api-energy-k8s.test.virtaglobal.com/v1/tests/3    1        OK
SetValues Station 3 n=10
    Log  Check setValues Station 3 Valid Partition High Boundary
    Check setValues    https://api-energy-k8s.test.virtaglobal.com/v1/tests/3    10       OK
SetValues Station 3 n=11
    Log  Check setValues Station 3 Invalid Partition Low Boundary
    Check setValues    https://api-energy-k8s.test.virtaglobal.com/v1/tests/3    11       FAILED

SetValues Station 4 n=0
    Log  Check setValues Station 4 Valid Partition Low Boundary
    Check setValues    https://api-energy-k8s.test.virtaglobal.com/v1/tests/4    0        FAILED
SetValues Station 4 n=1
    Log  Check setValues Station 4 Valid Partition Low Boundary
    Check setValues    https://api-energy-k8s.test.virtaglobal.com/v1/tests/4    1        OK
SetValues Station 4 n=10
    Log  Check setValues Station 4 Valid Partition High Boundary
    Check setValues    https://api-energy-k8s.test.virtaglobal.com/v1/tests/4    10       OK
SetValues Station 4 n=11
    Log  Check setValues Station 4 Invalid Partition Low Boundary
    Check setValues    https://api-energy-k8s.test.virtaglobal.com/v1/tests/4    11       FAILED

SetValues Station 5 n=0
    Log  Check setValues Station 5 Valid Partition Low Boundary
    Check setValues    https://api-energy-k8s.test.virtaglobal.com/v1/tests/5    0        FAILED
SetValues Station 5 n=1
    Log  Check setValues Station 5 Valid Partition Low Boundary
    Check setValues    https://api-energy-k8s.test.virtaglobal.com/v1/tests/5    1        OK
SetValues Station 5 n=10
    Log  Check setValues Station 5 Valid Partition High Boundary
    Check setValues    https://api-energy-k8s.test.virtaglobal.com/v1/tests/5    10       OK
SetValues Station 5 n=11
    Log  Check setValues Station 5 Invalid Partition Low Boundary
    Check setValues    https://api-energy-k8s.test.virtaglobal.com/v1/tests/5    11       FAILED