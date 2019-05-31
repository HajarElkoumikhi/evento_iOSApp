//
//  ClientService.swift
//  evento_iOSApp
//
//  Created by EventoTeam on 29/04/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//


import Foundation

protocol ClientServiceDelegate: class {
    func clientsLoaded()
}

class ClientService {
    static let instance = ClientService()

    weak var delegate: ClientServiceDelegate?
    var clientsArray = [Client]()


        //Get all clients
        func getAllClients(){
            let sessionConfig = URLSessionConfiguration.default

            //Create session, and optionally set a URLSessionDelegate
            let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)

            // Create the request
            // Get all clients (Get /clients)
            guard let URL = URL(string: GET_ALL_CLIENTS_URL) else {return}
            var request = URLRequest(url: URL)
            request.httpMethod = "GET"
            let task = session.dataTask(with: request, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) -> Void in
                if (error == nil){
                    //Success
                    let statusCode = (response as! HTTPURLResponse).statusCode
                    print("URL Session Task Succeeded: HTTP \(statusCode)")

                    if let data = data {
                        self.clientsArray = Client.parseClientData(data: data)
                        
                        self.delegate?.clientsLoaded()
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
