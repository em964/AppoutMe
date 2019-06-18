//
//  AppoutMeUITests.swift
//  AppoutMeUITests
//
//  Created by Ernesto Daniel Mejia Valdiviezo on 6/14/19.
//  Copyright © 2019 Ernesto Daniel Mejia Valdiviezo. All rights reserved.
//

import XCTest

class AppoutMeUITests: XCTestCase {

    func testInitialState() {
        let app = XCUIApplication()
        app.launch()
        let scrollViewsQuery = app.scrollViews
        scrollViewsQuery.otherElements.containing(.staticText, identifier:"Skills").children(matching: .other).element.swipeUp()
        scrollViewsQuery.otherElements.containing(.staticText, identifier:"Work Experience").children(matching: .other).element.swipeUp()
        scrollViewsQuery.otherElements.containing(.staticText, identifier:"Programming Languages").element.swipeUp()
        app.statusBars.element.tap()
    }


}
