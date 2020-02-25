import XCTest

import configTests

var tests = [XCTestCaseEntry]()
tests += configTests.allTests()
XCTMain(tests)
