//
//  ViewController.swift
//  ios-fabric-twitter-demo
//
//  Created by Eiji Kushida on 2017/03/31.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    private let loginHelper = TwitterLoginHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        setupLoginButton()
        loginHelper.delegate = self
    }
    
    private func setupLoginButton() {
        loginButton
            .setTitle(loginHelper.showButtonTitle(),
                      for: .normal)
    }
    
    @IBAction func didTapLoginButton(_ sender: UIButton) {
        
        if let userID = loginHelper.userID() {
            loginHelper.logout(userID: userID)
        } else {
            loginHelper.login()
        }
    }
}

extension ViewController: TwitterLoginDelegate {
    
    func complated(status: TwitterLoginStatus) {
        
        var title = ""
        
        switch status {
        case .login:
            title = "ログアウト"
        case .logout:
            title = "ログイン"
        }        
        loginButton.setTitle(title, for: .normal)
    }
}
