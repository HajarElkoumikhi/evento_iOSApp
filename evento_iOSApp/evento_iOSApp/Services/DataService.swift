//
//  UserController.swift
//  evento_iOSApp
//
//  Created by EventoTeam on 23/04/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//


//parseUserData

import Foundation

protocol DataServiceDelegate: class {
    func usersLoaded()
}

class DataService {
    static let instance = DataService()
    
    weak var delegate: DataServiceDelegate?
    var usersArray = [User]()
    
    //Get all food trucks
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
        
        

    
    
    //POST add a new foodtruck
//    func addNewFoodTruck(_ name:String, foodtype:String, avgCost: Double, latitude:Double, longitude:Double, completion:@escaping callbacks){
//        //Construct our JSON
//
//        let json: [String:Any] = [
//            "name": name,
//            "foodtype": foodtype,
//            "avgcost": avgCost,
//            "geometry":[
//                "coordinates" :[
//                    "lat": latitude,
//                    "long": longitude
//
//                ]
//            ]
//        ]
//
//        //        do {
//        //            //Serialize JSON
//        //            let jsonData = try JSONSerialization.data(withJSONObject: JSONSerialization, options: .prettyPrinted )
//        //        }catch let
//
//    }


}
