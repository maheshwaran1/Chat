//
//  LoginViewController.swift
//  Chat
//
//  Created by Maheshwaran on 18/02/22.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if let e = error {
                print(e.localizedDescription)
            } else {
                // Navigate to the ChatViewController
                strongSelf.performSegue(withIdentifier: K.loginSegue, sender: self)
            }
        }
        }
    }
            
    
}

