//
//  ViewController.swift
//  SimpleECommerce
//
//  Created by Ahmed Ragab on 3/7/20.
//  Copyright © 2020 Ahmed Ragab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        let storyBoard = UIStoryboard(name: Storyboard.LoginStoryboard, bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: StoryboardId.LoginVC)
        present(controller, animated: true, completion: nil)
    }


}

