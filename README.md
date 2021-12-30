# UnitTestingNetworkCalls-Swift

Project shows how to unit test asynchronous API calls in Swift using Mocking without using any 3rd party software.

- Swift Storyboard is used (the code can be transferred to a SwiftUI project)
- iOS Deployment Target: 15.2
- Xcode Version: 13.2
- Test API: https://api.punkapi.com/v2/beers

In its current state, when the project is run a simple list of data will be visible within the Xcode Command line.

Additions that can be made to this project using TDD:
- Pull and display additional data from the API (currently only the name is displayed).
- Insert the returned API list into a UI Table View.
- Add a table refresh function.

References: <br>
- Use async/await with URLSession - https://developer.apple.com/videos/play/wwdc2021/10095/
- Asynchronous Testing in Swift - https://semaphoreci.com/blog/asynchronous-testing-swift
