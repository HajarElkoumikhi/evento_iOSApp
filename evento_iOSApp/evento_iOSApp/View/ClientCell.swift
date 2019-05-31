//
//  ClientCell.swift
//  evento_iOSApp
//
//  Created by Elitia Candy on 30/04/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//

import Foundation
import UIKit

class ClientCell: UITableViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    
    func configureCell(client: Client){
        usernameLabel.text = client.username
        cityLabel.text = client.city
        
    }
    
    
}

