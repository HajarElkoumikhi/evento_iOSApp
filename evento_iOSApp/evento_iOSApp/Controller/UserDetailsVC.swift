//
//  userDetailsVC.swift
//  evento_iOSApp
//
//  Created by Elitia Candy on 07/05/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//

import UIKit
import MapKit

class UserDetailsVC: UIViewController {
    
    var selectedUser:User?

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.text = selectedUser?.username
        cityLabel.text = selectedUser?.city
        
        
        
        
    }
    

}
