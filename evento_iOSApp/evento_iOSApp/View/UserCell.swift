//
//  ClientCell.swift
//  evento_iOSApp
//
//  Created by EventoTeam on 27/04/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//

import Foundation
import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!

    
    func configureCell(user: User){
        usernameLabel.text = user.username
        emailLabel.text = user.email
        cityLabel.text = user.city
        
    }
    
}
