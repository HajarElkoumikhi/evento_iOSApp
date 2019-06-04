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
    var cities: [[String:String]]? = [["":""]]
    var name: String? = ""
    var numberOfUsers: String? = ""
    
    
    static func parseEventData(data: Data) -> [Event] {
        var eventsArray = [Event]()
        
        do {
            //            let jsonResult = try JSONSerialization.jsonObject(with: data, options: [.allowFragments])
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

//                    newEvent.cities = event["cities"] as? [String:String]
//                    newEvent.cities = event["cities"] as? [[String:String]]
//                    for city in (newEvent.cities?)! {
//                        newEvent.name = city["name"] as? String
//                        newEvent.numberOfUsers = city["numberOfUsers"] as? String
//                    }

//                    guard (cities?[0]["name"]) != nil else { return }
//                    var name = newEvent.cities?[0]["name"] as? String
//                    print(name)
//                    print(cities)
                    
                    newEvent.cities = event["cities"] as? [[String:String]]
                    for city in newEvent.cities ?? [["no city found": "number of users : 0"]]  {
                        newEvent.name = city["name"] ?? ""
                        newEvent.numberOfUsers = city["numberOfUsers"] ?? ""
                    }
                    



                    eventsArray.append(newEvent)
                }
            }

        }catch let err {
            print(err)
        }
        
        
//        do {
//            let jsonResult = try JSONSerialization.jsonObject(with: data, options:[])
//
//            //Parse JSON Data
//            if let events = jsonResult as? [[String:Any]] {
//                for event in events {
//                    let newEvent = Event()
//                    newEvent.title = event["title"] as? String
//                    newEvent.eventDescription = event["description"] as? String
//
//                    newEvent.cities = event["cities"] as? [[String:String]]
//                    for city in newEvent.cities ?? [["no city found": "number of users : 0"]]  {
//                        newEvent.name = city["name"] ?? ""
//                        newEvent.numberOfUsers = city["numberOfUsers"] ?? ""
//                    }
//                    eventsArray.append(newEvent)
//                }
//            }
//
//        }catch  {
//            print(error)
//        }
        
        return eventsArray
    }

}

