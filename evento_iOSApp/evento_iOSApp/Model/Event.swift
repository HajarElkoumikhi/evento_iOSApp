//
//  Events.swift
//  evento_iOSApp
//
//  Created by Elitia Candy on 29/04/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//

import Foundation

class Event: NSObject{
    
    var title: String? = ""
    var date: String? = ""
    var city: String? = ""
    var country: String? = ""
    var eventDescription: String? = ""
    
    
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
                    
                    eventsArray.append(newEvent)
                }
            }
            
        }catch let err {
            print(err)
        }
        
        return eventsArray
    }
}
