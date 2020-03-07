//
//  RegisterVC.swift
//  SimpleECommerce
//
//  Created by Ahmed Ragab on 3/7/20.
//  Copyright © 2020 Ahmed Ragab. All rights reserved.
//

import UIKit
import Firebase
class RegisterVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt:UITextField!
    @IBOutlet weak var confirmPassTxt:UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var passCheckImg: UIImageView!
    @IBOutlet weak var confirmPassCheckImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        passwordTxt.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: UIControl.Event.editingChanged)
        confirmPassTxt.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: UIControl.Event.editingChanged)
        
    }
    @objc func textFieldDidChanged(_ sender:UITextField){
        if sender == confirmPassTxt{
            passCheckImg.isHidden = false
            confirmPassCheckImg.isHidden = false
        }
        if passwordTxt.text == confirmPassTxt.text{
            passCheckImg.image = UIImage(named:AppImages.greenCheck )
            confirmPassCheckImg.image = UIImage(named:AppImages.greenCheck )
    }
        else{
            passCheckImg.image = UIImage(named:AppImages.redCheck )
            confirmPassCheckImg.image = UIImage(named:AppImages.redCheck )
        }
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        
    guard let email = emailTxt.text , email.isNotEmpty,
        let username = usernameTxt.text , username.isNotEmpty,
        let password = passwordTxt.text , password.isNotEmpty
        else {return}
        activityIndicator.startAnimating()
        
        guard let AuthUser = Auth.auth().currentUser else {return}
        
        
        // make the credinital part
        let credinital = EmailAuthProvider.credential(withEmail: email, password: password)
        
        AuthUser.link(with: credinital) { (AuthDataResult, error) in
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
}
