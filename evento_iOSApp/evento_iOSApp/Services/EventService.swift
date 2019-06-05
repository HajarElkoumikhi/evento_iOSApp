//
//  EventService.swift
//  evento_iOSApp
//
//  Created by EventoTeam on 29/04/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//

import Foundation

protocol EventServiceDelegate: class {
    func eventsLoaded()
}

class EventService {
    static let instance = EventService()
    
    weak var delegate: EventServiceDelegate?
    var eventsArray = [Event]()
    
    
    //Get all events
    func getAllEvents(){
        let sessionConfig = URLSessionConfiguration.default
        
        //Create session, and optionally set a URLSessionDelegate
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        // Create the request
        // Get all events (Get /events)
        guard let URL = URL(string: GET_ALL_EVENTS_URL) else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil){
                //Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                
                if let data = data {
                    self.eventsArray = Event.parseEventData(data: data)
//                    print("Events data loaded")
                    self.delegate?.eventsLoaded()
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
