//
//  ViewController.swift
//  ChallengeOnboarding
//
//  Created by Ellington Cavalcante on 30/08/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    var screen: LoginScreen?
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        
    }
}

extension LoginViewController: LoginScreenProtocol {
    func actionRegisterButton() {
        print(#function)
    }
    
    func actionSignInButton() {
        print(#function)
    }
}
