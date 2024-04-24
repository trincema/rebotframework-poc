# Test Analysis and Design
## Specifications
Endpoint: [POST] https://api-energy-k8s.test.virtaglobal.com/v1/tests/{stationId}<br/>
Request body:<br/>
`{<br/>
    command: string,<br/>
    payload: null|string|number<br/>
}`<br/>
Request example:<br/>
`{<br/>
    command: 'setValues',<br/>
    payload: 1<br/>
}`<br/>
1. Command: getVersion. Expected Response: > 1.6<br/>
2. Command: getInterval. Expected Response: any value from 1 to 60<br/>
3. Command: setValues. Payload: {n} where n is a number<br/>
    a. If 1 < n < 10. Expected Response: OK.<br/>
    b. If n > 10. Expected Response: FAILED.<br/>

Stations are connected to the service via the internet by HTTP/HTTPS protocol. When
the service receives a test request, it will send the command to the station and reply
with the response from the station if the station is online. A station is compliant when all
expected responses are met. Implement software that automates station compliance
tests for stations with id = [1,2,3,4,5]
## StationGetVersion Compliance Test Analysis
The documentation only specifies that `Expected Response: > 1.6`.
After some investigation I concluded that the payload does not influence the response,
so if we have 5 stations we have to make sure they are compliant, we can have the following test scenarios:
| Scenario                        | Parameters        | Expected Response        | Status code |
| :-----------------------------: | :---------------: | :----------------------: | :---------: |
| Station 1 Version Compliance    | payload=null      | {'result': >'1.6'}       | 200         |
| Station 2 Version Compliance    | payload=null      | {'result': >'1.6'}       | 200         |
| Station 3 Version Compliance    | payload=null      | {'result': >'1.6'}       | 200         |
| Station 4 Version Compliance    | payload=null      | {'result': >'1.6'}       | 200         |
| Station 5 Version Compliance    | payload=null      | {'result': >'1.6'}       | 200         |

## StationGetInverval Compliance Test Analysis
The documentation only specifies that Expected `Response: any value from 1 to 60`.
After some investigation I concluded that the payload does not influence the response,
so if we have 5 stations we have to make sure they are compliant, we can have the following test scenarios:
| Scenario                        | Parameters        | Expected Response            | Status code |
| :-----------------------------: | :---------------: | :--------------------------: | :---------: |
| Station 1 Interval Compliance   | payload=null      | {'result': >='1' && <='60'}  | 200         |
| Station 2 Interval Compliance   | payload=null      | {'result': >='1' && <='60'}  | 200         |
| Station 3 Interval Compliance   | payload=null      | {'result': >='1' && <='60'}  | 200         |
| Station 4 Interval Compliance   | payload=null      | {'result': >='1' && <='60'}  | 200         |
| Station 5 Interval Compliance   | payload=null      | {'result': >='1' && <='60'}  | 200         |

## StationSetValues Compliance Test Analysis
Equivalence Partitioning
| Partition 1 - Invalid | Partition 2 - Valid    | Partition 3 - Invalid    |
| :-------------------: | :--------------------: | :----------------------: |
| n < 1                 | 1 < n < 10             | n > 10                   |

Boundary Value Analysis
| Partition 1 - Invalid | Partition 2 - Valid    | Partition 3 - Invalid    |
| :-------------------: | :--------------------: | :----------------------: |
| n = 0                 | n = 1, 10              | n = 11                   |

Test Scenarios
| Scenario                        | Parameters        | Expected Response        | Status code |
| :-----------------------------: | :---------------: | :----------------------: | :---------: |
| Station 1 SetValues Compliance  | payload=0         | {'result': 'FAILED'}     | 200         |
| Station 1 SetValues Compliance  | payload=1         | {'result': 'OK'}         | 200         |
| Station 1 SetValues Compliance  | payload=10        | {'result': 'OK'}         | 200         |
| Station 1 SetValues Compliance  | payload=11        | {'result': 'FAILED'}     | 200         |
| :-----------------------------: | :---------------: | :----------------------: | :---------: |
| Station 2 SetValues Compliance  | payload=0         | {'result': 'FAILED'}     | 200         |
| Station 2 SetValues Compliance  | payload=1         | {'result': 'OK'}         | 200         |
| Station 2 SetValues Compliance  | payload=10        | {'result': 'OK'}         | 200         |
| Station 2 SetValues Compliance  | payload=11        | {'result': 'FAILED'}     | 200         |
| :-----------------------------: | :---------------: | :----------------------: | :---------: |
| Station 3 SetValues Compliance  | payload=0         | {'result': 'FAILED'}     | 200         |
| Station 3 SetValues Compliance  | payload=1         | {'result': 'OK'}         | 200         |
| Station 3 SetValues Compliance  | payload=10        | {'result': 'OK'}         | 200         |
| Station 3 SetValues Compliance  | payload=11        | {'result': 'FAILED'}     | 200         |
| :-----------------------------: | :---------------: | :----------------------: | :---------: |
| Station 4 SetValues Compliance  | payload=0         | {'result': 'FAILED'}     | 200         |
| Station 4 SetValues Compliance  | payload=1         | {'result': 'OK'}         | 200         |
| Station 4 SetValues Compliance  | payload=10        | {'result': 'OK'}         | 200         |
| Station 4 SetValues Compliance  | payload=11        | {'result': 'FAILED'}     | 200         |
| :-----------------------------: | :---------------: | :----------------------: | :---------: |
| Station 5 SetValues Compliance  | payload=0         | {'result': 'FAILED'}     | 200         |
| Station 5 SetValues Compliance  | payload=1         | {'result': 'OK'}         | 200         |
| Station 5 SetValues Compliance  | payload=10        | {'result': 'OK'}         | 200         |
| Station 5 SetValues Compliance  | payload=11        | {'result': 'FAILED'}     | 200         |