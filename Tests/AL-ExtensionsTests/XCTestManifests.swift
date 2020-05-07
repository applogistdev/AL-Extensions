import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AL_ExtensionsTests.allTests),
    ]
}
#endif
