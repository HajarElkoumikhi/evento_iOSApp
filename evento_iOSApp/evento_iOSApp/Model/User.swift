//
//  User.swift
//  evento_iOSApp
//
//  Created by EventoTeam on 19/04/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//

import Foundation

class User: NSObject{
    
    var userID: String? = ""
    var username: String? = ""
    var firstName: String? = ""
    var lastName: String? = ""
    var email: String? = ""
    var password: String? = ""
    var birthDate: String? = ""
    var city: String? = ""
    var country: String? = ""
    var phoneNumber: String? = ""
    var ipAddress: String? = ""
    var sexe: String? = ""
    

    
    static func parseUserData(data: Data) -> [User] {
        var usersArray = [User]()
        
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            
            //Parse JSON Data
            if let users = jsonResult as? [Dictionary<String,AnyObject>] {
                for user in users {
                    let newUser = User()
                    newUser.userID = user["_id"] as? String
                    newUser.username = user["username"] as? String
                    newUser.firstName = user["firstname"] as? String
                    newUser.lastName = user["lastname"] as? String
                    newUser.email = user["email"] as? String
                    newUser.password = user["password"] as? String
                    newUser.birthDate = user["date_naissance"] as? String
                    newUser.city = user["city"] as? String
                    newUser.country = user["country"] as? String
                    newUser.phoneNumber = user["phoneNumber"] as? String
                    newUser.ipAddress = user["ipAddress"] as? String
                    newUser.sexe = user["sex"] as? String
                    
                    
                    usersArray.append(newUser)
                }
            }
            
        }catch let err {
            print(err)
        }
        
        return usersArray
    }
}
