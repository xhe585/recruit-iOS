//
//  ASBInterviewExerciseTests.swift
//  ASBInterviewExerciseTests
//
//  Created by ASB on 29/07/21.
//

import XCTest
@testable import ASBInterviewExercise

class ASBInterviewExerciseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetTransactions() throws {
        let expectation = XCTestExpectation(description: "Fetch transactions")
        let apiService = DIManager.shared.resolve(TransactionApiService.self)
        apiService?.fetch(completionHandler: { transactions in
            expectation.fulfill()
        }, errorHandler: { error in
            XCTFail("Fetch transactions failed")
        })
        wait(for: [expectation], timeout: 1)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
