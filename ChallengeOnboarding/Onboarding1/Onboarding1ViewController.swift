//
//  Onboarding1ViewController.swift
//  ChallengeOnboarding
//
//  Created by Ellington Cavalcante on 01/09/23.
//

import UIKit

class Onboarding1ViewController: UIViewController {
    
    var screen: Onboarding1Screen?
    
    override func loadView() {
        screen = Onboarding1Screen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        swipeGesture()
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func swipeGesture() {
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeFuncLeft(_:)))
        swipeLeft.direction = .left
        screen?.addGestureRecognizer(swipeLeft)
    }
    
    @objc func swipeFuncLeft(_ gesture: UIGestureRecognizer) {
        let onBoarding2: Onboarding2ViewController = Onboarding2ViewController()
        navigationController?.pushViewController(onBoarding2, animated: true)
    }
}

extension Onboarding1ViewController: Onboarding1ScreenProtocol {
    func actionArrowButton() {
        let onBoarding2: Onboarding2ViewController = Onboarding2ViewController()
        navigationController?.pushViewController(onBoarding2, animated: true)
    }
    
    func actionSkipButton() {
        let welcome: LoginViewController = LoginViewController()
        navigationController?.pushViewController(welcome, animated: true)
    }
}
