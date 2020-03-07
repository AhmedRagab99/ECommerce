//
//  ViewController.swift
//  SimpleECommerce
//
//  Created by Ahmed Ragab on 3/7/20.
//  Copyright © 2020 Ahmed Ragab. All rights reserved.
//

import UIKit
import Firebase

class HomeVC: UIViewController {

    @IBOutlet weak var loginOutButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        if  Auth.auth().currentUser == nil{
            Auth.auth().signInAnonymously { (AuthDataResult,error) in
                if let error = error{
                    debugPrint(error)
                    self.handleFireAuthError(error: error)
                }
            }
        }
    }
  
    
    override func viewDidAppear(_ animated: Bool) {
     
        if let user = Auth.auth().currentUser,!user.isAnonymous{
            loginOutButton.title = "Logout"
        }else{
            loginOutButton.title = "Login"
        }
    }
    
    @IBAction func login_logout_Clicked(_ sender: Any) {
        guard let user = Auth.auth().currentUser else {return}
        if user.isAnonymous{
            presentLogin()
        }else{
            do{
                try Auth.auth().signOut()
                Auth.auth().signInAnonymously { (AuthDataResult, error) in
                    if let error = error{
                        debugPrint(error)
                        self.handleFireAuthError(error: error)

                        return
                    }else{
                        self.presentLogin()
                    }
                }
            }catch{
                debugPrint(error.localizedDescription)
                self.handleFireAuthError(error: error)

            }
        }
        
    }
    
    
    fileprivate func presentLogin() {
        let storyBoard = UIStoryboard(name: Storyboard.LoginStoryboard, bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: StoryboardId.LoginVC)
        present(controller, animated: true, completion: nil)
    }


}

