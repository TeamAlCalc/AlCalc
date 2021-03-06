
//
//  AlCalcUITests.swift
//  AlCalcUITests
//
//  Created by Ethan on 3/16/16.
//  Copyright © 2016 Team AlCalc. All rights reserved.
//

import XCTest

class AlCalcUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        
        let app = XCUIApplication()
        app.buttons["New Party"].tap()
        app.navigationBars["Guest List"].buttons["Add"].tap()
        
        let collectionViewsQuery = app.alerts["Add Guest"].collectionViews
        collectionViewsQuery.textFields["Drinking Buds"]
        collectionViewsQuery.buttons["Add"].tap()
        XCTAssert(app.textFields["Drinking Buds"].exists)
        
    }
    
}
