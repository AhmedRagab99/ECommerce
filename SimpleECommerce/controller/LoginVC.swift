//
//  LoginVC.swift
//  SimpleECommerce
//
//  Created by Ahmed Ragab on 3/7/20.
//  Copyright © 2020 Ahmed Ragab. All rights reserved.
//

import UIKit
import Firebase
class LoginVC: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func forgetPassClicked(_ sender: Any) {
    }
    @IBAction func loginClicked(_ sender: Any) {
        guard let email = emailTxt.text , email.isNotEmpty,
            let password = passwordTxt.text , password.isNotEmpty else {return}
        
        activityIndicator.startAnimating()
        Auth.auth().signIn(withEmail: email, password: password) { (AuthDataResult, error) in
            if let error = error {
                self.activityIndicator.stopAnimating()
                debugPrint(error)
                self.handleFireAuthError(error: error)
                return
            }
            self.activityIndicator.stopAnimating()
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func continueAsGuastClicked(_ sender: Any) {
    }
}
