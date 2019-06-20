//
//  testAllEventsVC.swift
//  evento_iOSAppTests
//
//  Created by Elitia Candy on 17/06/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//

import XCTest
@testable import evento_iOSApp


class testAllEventsVC: XCTestCase {
    
    var controller: UIViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        controller = storyboard.instantiateInitialViewController() as! UIViewController
    }
    
    override func tearDown() {
        super.tearDown()
        
        controller = nil
    }
    
}
