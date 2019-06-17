//
//  DashboardVC.swift
//  evento_iOSApp
//
//  Created by EventoTeam on 29/04/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class DashboardVC: UIViewController {
    var menuIsHidden = true
    
    
    @IBOutlet weak var menu: UIView!
    @IBOutlet weak var eventsButton: UILabel!
    
    @IBOutlet weak var leadingConstraint_outlet: NSLayoutConstraint!
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        setupMenu()      
        
    }
    
    
    
    @IBAction func menuToggle(_ sender: UIBarButtonItem) {
        if menuIsHidden {
            leadingConstraint_outlet.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: self.view.layoutIfNeeded)
        }
        else {
            leadingConstraint_outlet.constant = -290
            UIView.animate(withDuration: 0.3, animations: self.view.layoutIfNeeded)
            
        }
        
        menuIsHidden = !menuIsHidden
    }
    
    
    func setupMenu(){
        leadingConstraint_outlet.constant = -290
        menu.layer.shadowOpacity = 0.5
        menu.layer.shadowRadius = 6
    }
    
    
}
