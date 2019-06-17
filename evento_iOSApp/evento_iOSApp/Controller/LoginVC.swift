//
//  LoginVC.swift
//  evento_iOSApp
//
//  Created by EventoTeam on 28/04/2019.
//  Copyright © 2019 EventoTeam. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    
    @IBAction func loginButton(_ sender: Any) {
        guard let _ = emailField.text, emailField.text != "", let password = passwordField.text, passwordField.text != "" else {
            self.showAlert(with: "Error", message: "Please enter a correct email and password")

            return
        }
        
        
        if passwordField.text != "evento00" {
            self.showAlert(with: "Error", message: "Incorrect password!")
        }
        else {
            self.performSegue(withIdentifier: "loginSegue", sender: self)
        }

//        AuthService.instance.registerUser(email: email, password: password, completion: {Success in

//            if Success {
//                AuthService.instance.login(email: email , password: password, completion: {Success in
//
//                    if Success {
////                        self.dismiss(animated: true, completion: nil)
//
//                            self.performSegue(withIdentifier: "loginSegue", sender: self)
//
//
//                    }
//                    else {
//
//
//                        OperationQueue.main.addOperation {
//                            self.showAlert(with: "Error", message: "Incorrect password!")
//                        }
//                    }
//                })
//            }
//            else {
//                OperationQueue.main.addOperation {
//                    self.showAlert(with: "Error", message: "Unknown error occured saving your account!")
//                }
//            }
//        })
    }
    

    
    func showAlert(with title:String?, message:String?){
        let alertController = UIAlertController(title: title,message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title:"OK",style:.default, handler: nil)
        
        alertController.addAction(okAction)
        present(alertController,animated: true,completion: nil)
        
    }

}
