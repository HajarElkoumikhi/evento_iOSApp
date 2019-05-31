//
//  EventCell.swift
//  evento_iOSApp
//
//  Created by Elitia Candy on 29/04/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//

import Foundation
import UIKit

class EventCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(event: Event){
        
        titleLabel.text = event.title
        dateLabel.text = event.date
        cityLabel.text = event.city
        
    }
    
}
