//
//  File.swift
//  PhotoStash
//
//  Created by Austin Prince on 2/13/18.
//  Copyright © 2018 photostash. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController : UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
    @IBAction func loginPressed(_ sender: Any) {
        guard let username = username.text else { return }
        guard let password = password.text else { return }
        Auth.auth().signIn(withEmail: username, password: password, completion: { (user, error) in
            if error != nil {
                var message: String = ""
                print("I had an error")
                Auth.auth().fetchProviders(forEmail: username, completion: { (emails, error) in
                    if error != nil {
                        message = "Invalid email"
                        return
                    }
                    else if emails?.count == 0 {
                        message = "Invalid email"
                    }
                    else {
                        message = "Invalid password"
                    }
                })
                if message.count == 0 {
                    message = "Invalid login credentials"
                }
                
                let alertController = UIAlertController(title: "Login Failed!", message: message, preferredStyle: .alert)
                
                
                let okayAction = UIAlertAction(title: "Okay", style: .default, handler: { (action) -> Void in
                    //do nothing aka close alert
                })
                
                alertController.addAction(okayAction)
                self.present(alertController, animated: true, completion: nil)
                //self.presentedViewController(alertController, animated:)
                //self.present(alertController, animated: true, completion: nil)
                return
            }
           
            self.performSegue(withIdentifier: "loginSegue", sender: sender)
            
        })
    }
    
    
    @IBOutlet weak var signupPressed: UIButton!
}
