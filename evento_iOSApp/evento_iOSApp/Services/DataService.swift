//
//  UserController.swift
//  evento_iOSApp
//
//  Created by EventoTeam on 23/04/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//


//parseUserData

//import Foundation
//
//protocol UserServiceDelegate: class {
//    func usersLoaded()
//    func eventsLoaded()
//}
//
//class UserService {
//    static let instance = UserService()
//    
//    weak var delegate: DataServiceDelegate?
//    var usersArray = [User]()
//    var eventsArray = [Event]()
//    var clientsArray = [Client]()
//    
//    
//    
//    //Get all users
//    func getAllUsers(){
//        let sessionConfig = URLSessionConfiguration.default
//        
//        //Create session, and optionally set a URLSessionDelegate
//        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
//        
//        // Create the request
//        // Get all users (Get /users)
//        guard let URL = URL(string: GET_ALL_USERS_URL) else {return}
//        var request = URLRequest(url: URL)
//        request.httpMethod = "GET"
//        let task = session.dataTask(with: request, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) -> Void in
//            if (error == nil){
//                //Success
//                let statusCode = (response as! HTTPURLResponse).statusCode
//                print("URL Session Task Succeeded: HTTP \(statusCode)")
//                
//                if let data = data {
//                    self.usersArray = User.parseUserData(data: data)
//                    self.delegate?.usersLoaded()
//                }
//            }
//            else {
//                // Failure
//                print("URL session failed \(error!.localizedDescription)")
//            }
//        })
//        task.resume()
//        session.finishTasksAndInvalidate()
//        
//    }
//    
//    
//    
//    
//    
//    
//    
//    //Get all events
//    func getAllEvents(){
//        let sessionConfig = URLSessionConfiguration.default
//        
//        //Create session, and optionally set a URLSessionDelegate
//        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
//        
//        // Create the request
//        // Get all events (Get /events)
//        guard let URL = URL(string: GET_ALL_EVENTS_URL) else {return}
//        var request = URLRequest(url: URL)
//        request.httpMethod = "GET"
//        let task = session.dataTask(with: request, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) -> Void in
//            if (error == nil){
//                //Success
//                let statusCode = (response as! HTTPURLResponse).statusCode
//                print("URL Session Task Succeeded: HTTP \(statusCode)")
//                
//                if let data = data {
//                    self.eventsArray = Event.parseEventData(data: data)
//                    self.delegate?.usersLoaded()
//                }
//            }
//            else {
//                // Failure
//                print("URL session failed \(error!.localizedDescription)")
//            }
//        })
//        task.resume()
//        session.finishTasksAndInvalidate()
//        
//    }
//
//
//    
//    
//    
//    //Get all clients
//    func getAllClients(){
//        let sessionConfig = URLSessionConfiguration.default
//        
//        //Create session, and optionally set a URLSessionDelegate
//        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
//        
//        // Create the request
//        // Get all clients (Get /clients)
//        guard let URL = URL(string: GET_ALL_CLIENTS_URL) else {return}
//        var request = URLRequest(url: URL)
//        request.httpMethod = "GET"
//        let task = session.dataTask(with: request, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) -> Void in
//            if (error == nil){
//                //Success
//                let statusCode = (response as! HTTPURLResponse).statusCode
//                print("URL Session Task Succeeded: HTTP \(statusCode)")
//                
//                if let data = data {
//                    self.clientsArray = Client.parseClientData(data: data)
//                    self.delegate?.usersLoaded()
//                }
//            }
//            else {
//                // Failure
//                print("URL session failed \(error!.localizedDescription)")
//            }
//        })
//        task.resume()
//        session.finishTasksAndInvalidate()
//        
//    }
//    
//
//
//}
