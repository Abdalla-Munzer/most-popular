//
//  most_popularUITests.swift
//  most-popularUITests
//
//  Created by Abdalla Munzer on 6/10/20.
//  Copyright © 2020 com.most-popular. All rights reserved.
//

import XCTest

class MostpopularUITests: XCTestCase {
    // swiftlint:disable all
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDidSelectCell() {
        let isExists = XCUIApplication().tables/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"8 Minutes and 46 Seconds: How George Floyd Was Killed in Police Custody")/*[[".cells.containing(.staticText, identifier:\"The Times has reconstructed the death of George Floyd on May 25. Security footage, witness videos and official documents show how a series of actions by officers turned fatal.\")",".cells.containing(.staticText, identifier:\"8 Minutes and 46 Seconds: How George Floyd Was Killed in Police Custody\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["Article"].exists
        
        XCTAssertFalse(isExists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
