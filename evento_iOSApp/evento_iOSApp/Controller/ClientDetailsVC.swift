//
//  clientDetailsVC.swift
//  evento_iOSApp
//
//  Created by Elitia Candy on 07/05/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//


import UIKit
import MapKit

class ClientDetailsVC: UIViewController {
    
    var selectedClient:Client?
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.text = selectedClient?.username
        descriptionLabel.text = selectedClient?.clientDescription
        cityLabel.text = selectedClient?.city
        phoneNumberLabel.text = selectedClient?.phoneNumber
        
    
    
    
    }
    
    
    
    //    func ceneterMapOnLocation(_ location:CLLocation){
    //        let coordinateRegion = MKCoordinateRegion(center: selectedFoodTruck!.coordinate, latitudinalMeters: 1000,longitudinalMeters: 1000)
    //
    //        foodtruckMap.setRegion(coordinateRegion, animated: true)
    //    }
    
}

