//
//  ToddTestUITests.swift
//  ToddTestUITests
//
//  Created by Carlos Alcala on 6/1/16.
//  Copyright © 2016 Carlos Alcala. All rights reserved.
//

import XCTest

class ToddTestUITests: XCTestCase {
        
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
    
    func testDiagnosis() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let app = XCUIApplication()
        app.tables.cells.elementBoundByIndex(0).tap()
        app.navigationBars["ToddTest.PatientView"].buttons["Save"].tap()
        

        //with static text
        let label1 = app.alerts["Patient Diagnosis"].staticTexts["100% Probability of Todd Syndrome"]
        XCTAssertEqual(label1.exists, true)

        //with predicates https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/Predicates/Articles/pSyntax.html
        let label2 = app.alerts["Patient Diagnosis"].staticTexts.elementMatchingPredicate(NSPredicate(format: "label ENDSWITH 'Probability of Todd Syndrome'"))
        XCTAssertEqual(label2.exists, true)
        
        
        app.alerts["Patient Diagnosis"].collectionViews.buttons["Continue"].tap()
    }
    
    func testNew() {
        
        let app = XCUIApplication()
        app.navigationBars["ToddTest.HomeView"].buttons["Add"].tap()
        
        let patientNameTextField = app.textFields["Patient Name"]
        patientNameTextField.tap()
        patientNameTextField.typeText("Test User")
        
        let steppersQuery = app.steppers
        let decrementButton = steppersQuery.buttons["Decrement"]
        decrementButton.tap()
        decrementButton.tap()
        decrementButton.tap()
        decrementButton.tap()
        decrementButton.tap()
        decrementButton.tap()
        app.switches["Switch1"].tap()
        app.switches["Switch2"].tap()
        app.buttons["Male"].tap()
        app.navigationBars["ToddTest.PatientView"].buttons["Save"].tap()
        app.alerts["Patient Diagnosis"].collectionViews.buttons["Continue"].tap()
        
        
    }
    
}
