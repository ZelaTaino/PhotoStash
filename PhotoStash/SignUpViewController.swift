//
//  SignUpViewController.swift
//  PhotoStash
//
//  Created by Ifeoma Ufondu on 2/9/18.
//  Copyright © 2018 photostash. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    

    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUp(_ sender: UIButton) {

            // ...
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
