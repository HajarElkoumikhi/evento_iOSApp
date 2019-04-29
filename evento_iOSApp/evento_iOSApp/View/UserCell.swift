//
//  ClientCell.swift
//  evento_iOSApp
//
//  Created by Elitia Candy on 27/04/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//

import Foundation
import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(user: User){
        firstNameLabel.text = user.firstName
        lastNameLabel.text = user.lastName
        
    }
    
}
