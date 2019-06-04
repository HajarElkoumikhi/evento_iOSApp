//
//  eventDetailsVC.swift
//  evento_iOSApp
//
//  Created by Elitia Candy on 07/05/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//

import UIKit
import MapKit

class EventDetailsVC: UIViewController {
    
    var selectedEvent:Event?
    
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var eventCityLabel: UILabel!
    @IBOutlet weak var eventCountryLabel: UILabel!
    
    
    @IBOutlet weak var city1Label: UILabel!
    @IBOutlet weak var city2Label: UILabel!
    @IBOutlet weak var city3Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        eventTitleLabel.text = selectedEvent?.title
        eventDescription.text = selectedEvent?.eventDescription
        eventCityLabel.text = selectedEvent?.city
        eventCountryLabel.text = selectedEvent?.country
        
        city1Label.text = selectedEvent?.cities?[0]["name"]
        city2Label.text = selectedEvent?.cities?[1]["name"]
        city3Label.text = selectedEvent?.cities?[2]["name"]
        
//        print(selectedEvent?.cities?.count as Any)
//        for city in selectedEvent?.cities ?? [["No city":"No users"]] {
//            print(city["name"])
//        }

    }

}
