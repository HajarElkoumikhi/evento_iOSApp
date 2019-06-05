//
//  AllUsersVC.swift
//  evento_iOSApp
//
//  Created by EventoTeam on 29/04/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//

import Foundation
import UIKit

class AllUsersVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var userService = UserService.instance
    var authService = AuthService.instance
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        userService.delegate = self
        tableView?.delegate = self 
        tableView?.dataSource = self
        UserService.instance.getAllUsers()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showUserDetailsSegue" {
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationViewController = segue.destination as! UserDetailsVC
                destinationViewController.selectedUser = userService.usersArray[indexPath.row]
            }
        }
    }
    
    
    
}


extension AllUsersVC: UserServiceDelegate {
    func usersLoaded() {
        OperationQueue.main.addOperation {
            self.tableView?.reloadData()
        }
    }
    
}


extension AllUsersVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userService.usersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserCell {
            cell.configureCell(user: userService.usersArray[indexPath.row])
//            print(userService.usersArray[indexPath.row])
            
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 200.0;//Custom row height
    }
    
    
}


