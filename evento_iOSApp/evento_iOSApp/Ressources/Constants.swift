//
//  Constants.swift
//  evento_iOSApp
//
//  Created by Elitia Candy on 23/04/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//

import Foundation

//Callbacks
//Typealias for callbacks  used in Data Service
typealias callbacks = (_ success: Bool ) -> ()

// API endpoint
let BASE_API_URL = "http://localhost:8080"

//GET all food trucks URL
let GET_ALL_USERS_URL = "\(BASE_API_URL)/users"
