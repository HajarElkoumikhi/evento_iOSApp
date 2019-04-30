//
//  Client.swift
//  evento_iOSApp
//
//  Created by Elitia Candy on 29/04/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//

import Foundation

class Client: NSObject{
    
    var username: String? = ""
    var city: String? = ""
    
    
    static func parseClientData(data: Data) -> [Client] {
        var clientsArray = [Client]()
        
        do {
            //            let jsonResult = try JSONSerialization.jsonObject(with: data, options: [.allowFragments])
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) 
            
            //Parse JSON Data
            if let clients = jsonResult as? [Dictionary<String,AnyObject>] {
                for client in clients {
                    let newClient = Client()
                    newClient.username = client["username"] as? String
                    newClient.city = client["city"] as? String
                    
                    clientsArray.append(newClient)
                }
            }
            
        }catch let err {
            print(err)
        }
        
        return clientsArray
    }
}
