//
//  TestingSceneDelegate.swift
//  FootballChantsTests
//
//  Created by waheedCodes on 29/10/2021.
//

@testable import FootballChants
import XCTest

final class ChantsViewControllerTests: XCTestCase {

    func test_chantsVC_loads() {
        let sut = ChantsViewController()
        
        sut.loadViewIfNeeded()
        
       
    }
}
