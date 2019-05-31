//
//  DashboardVC.swift
//  evento_iOSApp
//
//  Created by Elitia Candy on 29/04/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//

import Foundation
import UIKit

class DashboardVC: UIViewController {
    var menuIsHidden = true
    
    @IBOutlet weak var leadingConstraint_outlet: NSLayoutConstraint!
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        leadingConstraint_outlet.constant = -250
    }
    
    
    
    @IBAction func menuToggle(_ sender: UIBarButtonItem) {
        if menuIsHidden {
            leadingConstraint_outlet.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: self.view.layoutIfNeeded)
        }
        else {
            leadingConstraint_outlet.constant = -250
            UIView.animate(withDuration: 0.3, animations: self.view.layoutIfNeeded)
            
        }
        
        menuIsHidden = !menuIsHidden
    }
    
}
