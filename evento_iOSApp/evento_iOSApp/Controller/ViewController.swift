//
//  ViewController.swift
//  evento_iOSApp
//
//  Created by Elitia Candy on 30/04/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var open: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        open.target = self.revealViewController()
        open.action = #selector(SWRevealViewController.revealToggle(_:))
        
//        open.target(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        self.revealViewController().revealToggle(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
