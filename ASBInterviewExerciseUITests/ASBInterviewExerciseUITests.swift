//
//  ASBInterviewExerciseUITests.swift
//  ASBInterviewExerciseUITests
//
//  Created by ASB on 29/07/21.
//

import XCTest

class ASBInterviewExerciseUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTransactionsTable() throws {
        
        let app = XCUIApplication()
        app.activate()
        let collierGroupStaticText = XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["Collier Group"]/*[[".cells.staticTexts[\"Collier Group\"]",".staticTexts[\"Collier Group\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        collierGroupStaticText.tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
