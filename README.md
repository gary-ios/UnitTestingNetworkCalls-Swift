# UnitTestingNetworkCalls-Swift

Project shows how to unit test asynchronous API calls in Swift using Mocking without using any 3rd party software.

iOS Deployment Target: 15.2
Xcode Version: 13.2
Test API: "https://api.punkapi.com/v2/beers"

In its current state, when the project is run a simple list of data will be returned within the Xcode Command line.

Additions that can be made to this project using TDD:
- pull more data from the API and display it (currently only the name is displayed).
- Insert the returned API list into a UI Table View.
- Add a table refresh function.

References:
Use async/await with URLSession - https://developer.apple.com/videos/play/wwdc2021/10095/
Asynchronous Testing in Swift - https://semaphoreci.com/blog/asynchronous-testing-swift
