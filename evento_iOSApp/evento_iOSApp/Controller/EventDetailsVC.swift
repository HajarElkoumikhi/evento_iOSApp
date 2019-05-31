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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        eventTitleLabel.text = selectedEvent?.title
        eventDescription.text = selectedEvent?.eventDescription
        eventCityLabel.text = selectedEvent?.city
        eventCountryLabel.text = selectedEvent?.country
//        ceneterMapOnLocation(CLLocation(latitude:selectedEvent!.latitude, longitude: selectedFoodTruck!.longitude))


    }

//    func ceneterMapOnLocation(_ location:CLLocation){
//        let coordinateRegion = MKCoordinateRegion(center: selectedFoodTruck!.coordinate, latitudinalMeters: 1000,longitudinalMeters: 1000)
//
//        foodtruckMap.setRegion(coordinateRegion, animated: true)
//    }

}
