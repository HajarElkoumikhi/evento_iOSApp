//
//  testEvent.swift
//  evento_iOSAppTests
//
//  Created by EventoTeam on 17/06/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//

import XCTest
@testable import evento_iOSApp



class testEvent: XCTestCase {
        
        func testInitEvent() {
            let event = Event(title: "Conference", date: "10/08/2019", city: "Paris", country:"France")
            
            XCTAssertEqual("Conference", event.name)
            XCTAssertEqual("10/08/2019", event.date)
            XCTAssertEqual("Paris", event.city)
            XCTAssertEqual("Franc", event.country)
        }
    }


