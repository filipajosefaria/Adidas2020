//
//  AdidasUITests.swift
//  AdidasUITests
//
//  Created by BOLD on 08/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import XCTest
import Adidas

class AdidasUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launchArguments = ["enable-testing"]
        app.launch()

    }

    override func tearDown() {
        super.tearDown()
    }

    func testGoToProfile() {
        let app = XCUIApplication()
        app.buttons.element.tap()
        
        app.navigationBars["MY PROFILE"].buttons["Back"].tap()
    }

    func testStartWorkout() {
        let app = XCUIApplication()
        app.tables.cells.staticTexts["Tap to start a new workout"].tap()
        
        sleep(5)
        app.buttons.staticTexts["STOP"].tap()
        app.buttons.staticTexts["SAVE"].tap()
    }
    
    func testSetGoal() {
        
        let app = XCUIApplication()
        app.tables.cells.allElementsBoundByIndex[1].tap()
        
        let goal = app.tables.cells.staticTexts["Hard walk steps"]
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: goal, handler: nil)

        waitForExpectations(timeout: 5, handler: nil)
        goal.tap()
        
        XCTAssert(goal.exists)
    }
    
}
