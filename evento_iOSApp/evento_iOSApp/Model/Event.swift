//
//  Events.swift
//  evento_iOSApp
//
//  Created by EventoTeam on 29/04/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//

import Foundation

class Event: NSObject{
    
    var title: String? = ""
    var date: String? = ""
    var city: String? = ""
    var country: String? = ""
    var eventDescription: String? = ""
    var citiesArray: [[String:String]]? = [["":""]]
    var name: String? = ""
    var numberOfUsers: String? = ""
    var genderArray: [[String:String]]? = [["":""]]
    var maxNumber: String? = ""
    var womanNumber:String? = ""
    
    
    static func parseEventData(data: Data) -> [Event] {
        var eventsArray = [Event]()
        
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)

            //Parse JSON Data
            if let events = jsonResult as? [Dictionary<String,AnyObject>] {
                for event in events {
                    let newEvent = Event()
                    newEvent.title = event["title"] as? String
                    newEvent.date = event["date"] as? String
                    newEvent.city = event["city"] as? String
                    newEvent.country = event["country"] as? String
                    newEvent.eventDescription = event["description"] as? String
                    
                    newEvent.citiesArray = event["cities"] as? [[String:String]]
                    for city in newEvent.citiesArray ?? [["no city found": "number of users : 0"]]  {
                        newEvent.name = city["name"] ?? ""
                        newEvent.numberOfUsers = city["numberOfUsers"] ?? ""
                    }
                    
                    newEvent.genderArray = event["gender"] as? [[String:String]]
                    for genderElement in newEvent.genderArray ?? [["no gender found": "number of users : 0"]]  {
                        newEvent.name = genderElement["name"] ?? ""
                        newEvent.numberOfUsers = genderElement["numberOfUsers"] ?? ""
                    }
                    
                    eventsArray.append(newEvent)
                }
            }

        }catch let err {
            print(err)
        }
        
        return eventsArray
    }

}

