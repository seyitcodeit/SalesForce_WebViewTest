//
//  SalesForceLoginTestUITests.swift
//  SalesForceLoginTestUITests
//
//  Created by Seyit Kaya on 17.08.2020.
//  Copyright © 2020 Seyit Kaya. All rights reserved.
//

import XCTest
import UIKit

class SalesForceLoginTestUITests: XCTestCase {

    var app: XCUIApplication!
    
    // this one is for checking webviewlogin
    func testLogin() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        wait(for: 2)
        passLoginSalesForce()
        wait(for: 5)
     // after your login you cand add some methods here according to your app flow
    }
}

extension SalesForceLoginTestUITests {

func passLoginSalesForce() {
    
    //username typing..
    
    let textFieldVector = CGVector(dx: 247, dy: 436)
    let textFieldCoordinate = app.coordinate(withNormalizedOffset: .zero).withOffset(textFieldVector)
    textFieldCoordinate.tap()
    app.typeText("your salesforce username")
    
    // password typing..
    let secureTextFieldVector = CGVector(dx: 247, dy: 519)
    let secureTextFieldCoordinate = app.coordinate(withNormalizedOffset: .zero).withOffset(secureTextFieldVector)
    secureTextFieldCoordinate.tap()
    app.typeText("your password")
    
    // login to sandbox
    let sandboxButton = CGVector(dx: 247, dy: 580)
    let sandboxButtonCoordinate = app.coordinate(withNormalizedOffset: .zero).withOffset(sandboxButton)
    sandboxButtonCoordinate.tap()
    
    // allow
    wait(for: 5)
   
    // generally in salesforce control this process via SMS check so you need to pass here by manipulating Admin Side
    let allowButton = CGVector(dx: 423, dy: 666)
    let allowButtonC = app.coordinate(withNormalizedOffset: .zero).withOffset(allowButton)
    allowButtonC.tap()
    
    wait(for: 3)
    }
}

extension XCTestCase {
    func wait(for duration: TimeInterval) {
        let waitExpectation = expectation(description: "Waiting")
        
        let when = DispatchTime.now() + duration
        DispatchQueue.main.asyncAfter(deadline: when) {
            waitExpectation.fulfill()
        }
        // I use a buffer here to avoid flakiness with Timer on CI
        waitForExpectations(timeout: duration + 0.5)
    }
}
   
