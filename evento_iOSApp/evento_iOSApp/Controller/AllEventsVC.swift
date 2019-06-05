//
//  AllEventsVC.swift
//  evento_iOSApp
//
//  Created by EventoTeam on 29/04/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//

import Foundation
import UIKit

class AllEventsVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var eventService = EventService.instance
    var authService = AuthService.instance
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        eventService.delegate = self
        tableView?.delegate = self
        tableView?.dataSource = self
        EventService.instance.getAllEvents()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEventDetailsSegue" {
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationViewController = segue.destination as! EventDetailsVC
                destinationViewController.selectedEvent = EventService.instance.eventsArray[indexPath.row]
            }
        }
    }
    
    
}




// EXTENSIONS
extension AllEventsVC: EventServiceDelegate {
    
    func eventsLoaded() {
        OperationQueue.main.addOperation {
            self.tableView?.reloadData()
        }
    }
    
}


extension AllEventsVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventService.eventsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as? EventCell {
            cell.configureCell(event: eventService.eventsArray[indexPath.row])
//            print(eventService.eventsArray[indexPath.row])
            
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 200.0;//Custom row height
    }
    
    
}
