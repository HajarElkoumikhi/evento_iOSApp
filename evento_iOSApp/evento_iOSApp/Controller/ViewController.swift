//
//  ViewController.swift
//  evento_iOSApp
//
//  Created by EventoTeam on 08/04/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//

//import UIKit
//
//class ViewController: UIViewController {
//    
//    @IBOutlet weak var tableView:UITableView?
//    @IBOutlet weak var addButton: UIImage!
//    
//    var dataService = DataService.instance
//    var authService = AuthService.instance
//    
//    
//    override func viewDidLoad() {
//        
//        super.viewDidLoad()
//        
//        
//        dataService.delegate = self
//        tableView?.delegate = self
//        tableView?.dataSource = self
//        DataService.instance.getAllUsers()
//    }
//    
//    
//}
//
//
//extension ViewController: DataServiceDelegate {
//    func usersLoaded() {
//        OperationQueue.main.addOperation {
//            self.tableView?.reloadData()
//        }
//    }
//
//}
//
//
//extension ViewController: UITableViewDelegate,UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return dataService.usersArray.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserCell {
//            cell.configureCell(user: dataService.usersArray[indexPath.row])
//            
//            return cell
//        }
//        else {
//            return UITableViewCell()
//        }
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
//    {
//        return 200.0;//Custom row height
//    }
//    
//    
//}
//
//
