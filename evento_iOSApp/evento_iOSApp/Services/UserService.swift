//
//  UserService.swift
//  evento_iOSApp
//
//  Created by Elitia Candy on 29/04/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//

import Foundation

protocol UserServiceDelegate: class {
    func usersLoaded()
}

class UserService {
    static let instance = UserService()
    
    weak var delegate: UserServiceDelegate?
    var usersArray = [User]()
    
    
    
    //Get all users
    func getAllUsers(){
        let sessionConfig = URLSessionConfiguration.default
        
        //Create session, and optionally set a URLSessionDelegate
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        // Create the request
        // Get all users (Get /users)
        guard let URL = URL(string: GET_ALL_USERS_URL) else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil){
                //Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                
                if let data = data {
                    self.usersArray = User.parseUserData(data: data)
                    
                    self.delegate?.usersLoaded()
                }
            }
            else {
                // Failure
                print("URL session failed \(error!.localizedDescription)")
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
        
    }

}
