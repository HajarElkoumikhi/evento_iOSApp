//
//  AllClientsVC.swift
//  evento_iOSApp
//
//  Created by EventoTeam on 29/04/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//

import Foundation
import UIKit

class AllClientsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var clientsLabel: UILabel!
    
    var clientService = ClientService.instance
    var authService = AuthService.instance
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        clientService.delegate = self
        tableView?.delegate = self
        tableView?.dataSource = self
        ClientService.instance.getAllClients()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showClientDetailsSegue" {
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationViewController = segue.destination as! ClientDetailsVC
                destinationViewController.selectedClient = clientService.clientsArray[indexPath.row]
            }
        }
    }
    
    
}


extension AllClientsVC: ClientServiceDelegate{
    
    func clientsLoaded() {
        OperationQueue.main.addOperation {
            self.tableView?.reloadData()
        }
    }
    
}


extension AllClientsVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clientService.clientsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "clientCell", for: indexPath) as? ClientCell {
            cell.configureCell(client: clientService.clientsArray[indexPath.row])
            
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
    
    func setupViewController(){
        clientsLabel
            .text = NSLocalizedString("clientsLabel", comment: "clientsLabel")
    }
    
}
