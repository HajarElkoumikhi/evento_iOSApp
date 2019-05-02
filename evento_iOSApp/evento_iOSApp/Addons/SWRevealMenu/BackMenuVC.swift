//
//  BackMenuVC.swift
//  evento_iOSApp
//
//  Created by Elitia Candy on 30/04/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//

import Foundation

class BackMenuVC: UITableViewController {
    
    var menuArray = [String]()
    
    override func viewDidLoad() {
        menuArray = ["Profile", "Events","Clients","Users","About"]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return menuArray.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath ) as UITableViewCell
        
        cell.textLabel?.text = menuArray[indexPath.row]
        
        return cell
    }
    
    

    
}
