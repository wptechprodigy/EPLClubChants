//
//  FootballChantsTests.swift
//  FootballChantsTests
//
//  Created by waheedCodes on 29/10/2021.
//

import XCTest
@testable import FootballChants

class FootballChantsTests: XCTestCase {
    
    func test_application_shouldBeTrue() {
        let application = AppDelegate().application(
            UIApplication.shared,
            didFinishLaunchingWithOptions: nil
        )
        
        XCTAssertTrue(application)
    }
}
