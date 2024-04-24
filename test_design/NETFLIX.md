# Manual Test Asignment
## Requirements
- No testing accounts in production.
- Testing payments means using real credit cards (which means no automation).
- In order to avoid the above situations, how would you test in production?
## Initial Test Analysis
First of all, I am using Netflix on a weekly-basis, and my account has also been hacked in the past, so I have some good and bad experiences with it.<br />
If I remember correctly, I started Netflix with a trial account, so no payments, but now I see they don't offer trials anymore.
But none the less, there are a few tricks one can use to test User Registration in Netflix in production. One interesting trick is to use a gmail address and add a +index appended to it like `emanuel.tranc+001@gmail.com`, in this way we could use multiple accounts handled by the same email address (this trick only works with Gmail). But, since we will probably npt be able to use Trials, we would probably not be able to test the registration all the way through. So, we are going to miss a couple of features.<br />
So, what we could test would be the following:
- Enter email address, choose to/not to send special offers over email
- Choose your plan: Plan A (Premium 4k 11.99E), Plan B (Standard 1080p 9.99E), Plan C(Basic 720p 4.99E)
- Check Choose to Pay page
- And that's about it, since we cannot pay for it for every test
What we will not be able to test would be the following:
- Plan payment process
- Finish registration of a plan to make sure the feature works as expected for new clients.
## Production Testing (how would you test in production?)
Usually Production Testing is avoid by many QA Specialists, and for good reason. Its best to test in `development`, `staging`, and `pre-production` environments. Catching bugs early prevents users from seeing errors, increasing customer trust and overall satisfaction with a brand and its products.<br />
*However, catching all bugs in development and staging is not easy. Engineering and QA teams can spend a lot of time and effort building unit tests, test suites and test automation systems, trying to simulate the production environment, or manually verifying user flows with mock user data and test cases to try to expose bugs only to find out that a key corner-case was overlooked. In the end, many users may experience buggy software even after a large amount of time is spent testing in development*. [1] 3rd paragraph.<br />
*In many instances, it is impossible to completely simulate live, real-world software in a test environment. With all the dependancies present in modern production systems and the many possible edge cases, production testing has become a necessary part of devops and software testing. Top software companies such as Google, Netflix and Amazon constantly release new features to a fraction of their traffic to measure the impact*. [1] 4th paragraph.<br />
So, it seems that for a streaming company like Netflix, which has distributed services all over the world, it is important to do also some production testing, because issues might still slip testing development/staging environments alone. The product has complex deployment strategies and it seems they are doing some Production Testing with features deployed to a fraction of live production traffic. And for this of course we have to use Feature Flags, to have some ways to enable these features only for testing purposes. But I guess that Netflix Testers also have some test credit cars that can use to test production registration, or have some feature flags to simulate payments with some test credit cards or something like that.
![product-illustration_feature_flagging---hero](https://github.com/trincema/rebotframework-poc/assets/7762113/dd70a1e6-73ca-44f5-8d9e-4efcb9baa506)

So, the final answer to the question *how would you test in production?* would be the following:
- Use feature flags
- Use real test credit cards provided by the company (or mock them with feature flags?, food for thought)
- Also production monitoring could be used (Grafana, etc)
## How would you ensure issues are tracked?
- Well, I'm not really sure what is meant by this question, but it seems that many companies, among which also Netflix, acknowledges that QA Specialists will not be able to catch all issues by themselves, so they usually provide some sort of Help Center in order for clients to also report issues encountered while using the services: `https://help.netflix.com/en/`. This in effect is an entire feature in itself and also involves some human personnel (an entire department of customer support personnel, in the case of Netflix most probably also distributed accross the Globe) handling these kind of issues in some way or another. My account has been hacked at some point, so I reported the issue to Netflix, and a human support was assigned to me to talk it through, and also tried to solve the issue, and I bet she also opened a bug ticket internaly for the issue and in the end it was so bad that my gmail address was completely compromised, just changing the password didn't worked (Netflix representative advised me with this version 1st, but it didn't solved the issue), I had to change my email for the account in the end. It was a pretty embarrasing issue for a big company like Netflix.
![Screenshot 2024-04-11 094015](https://github.com/trincema/rebotframework-poc/assets/7762113/60dfa69f-111a-471b-8133-394f3f1b45e4)
## Test Analysis and Design (Positive)
| Scenario                        | Details                                            | Input        | Expected Outcome |
| :-----------------------------: | :------------------------------------------------: | :----------------------: | :---------: |
| Successful Registration         | Ensure users can register with valid credentials   | Valid email address, password, and personal information       | 200         |
| Station 2 Version Compliance    | payload=null      | {'result': >'1.6'}       | 200         |
| Station 3 Version Compliance    | payload=null      | {'result': >'1.6'}       | 200         |
| Station 4 Version Compliance    | payload=null      | {'result': >'1.6'}       | 200         |
| Station 5 Version Compliance    | payload=null      | {'result': >'1.6'}       | 200         |

## Test Analysis and Design (Negative)

## Notes
- There is not plan with 100E monthly fee. But I get the idea, it was just a simulation.

## References
- [1] Testing in production, Optimizely, [Link](https://www.optimizely.com/optimization-glossary/testing-in-production/#:~:text=Testing%20in%20production%20(TIP)%20is,released%20live%20to%20real%20users).