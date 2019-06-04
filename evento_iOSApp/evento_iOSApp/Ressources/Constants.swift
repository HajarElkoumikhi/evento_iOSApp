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
typealias callback = (_ success: Bool ) -> ()

// API endpoint
let BASE_API_URL = "http://localhost:7000"


//GET all food trucks URL
let GET_ALL_USERS_URL = "\(BASE_API_URL)/allUsers"
let GET_ALL_EVENTS_URL = "\(BASE_API_URL)/allEvents"
let GET_ALL_CLIENTS_URL = "\(BASE_API_URL)/allClients"

//Boolean auth UserDefaults keys
let DEFAULTS_REGISTERED = "isRegistered"
let DEFAULTS_AUTHENTICATED = "isAuthenticated"

//Auth Email
let DEFAULTS_EMAIL = "email"

//Auth Token
let DEFAULTS_TOKEN = "authToken"

//Register URL
let POST_REGISTER_USER = "\(BASE_API_URL)/register"

//Login URL
let POST_LOGIN_USER = "\(BASE_API_URL)/login"
