//
//  Onboarding2ViewController.swift
//  ChallengeOnboarding
//
//  Created by Ellington Cavalcante on 02/09/23.
//

import UIKit

class Onboarding2ViewController: UIViewController {

    var screen: Onboarding2Screen?
    
    override func loadView() {
        screen = Onboarding2Screen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        swipeRight()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func swipeRight() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeFuncRight(_:)))
        swipeRight.direction = .right
        screen?.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeFuncLeft(_:)))
        swipeLeft.direction = .left
        screen?.addGestureRecognizer(swipeLeft)
    }
    
    @objc func swipeFuncRight(_ gesture: UIGestureRecognizer) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func swipeFuncLeft(_ gesture: UIGestureRecognizer) {
        let onBoarding3: Onboarding3ViewController = Onboarding3ViewController()
        navigationController?.pushViewController(onBoarding3, animated: true)
    }
}

extension Onboarding2ViewController: Onboarding2ScreenProtocol {
    func actionArrowButton() {
        let onBoarding3: Onboarding3ViewController = Onboarding3ViewController()
        navigationController?.pushViewController(onBoarding3, animated: true)
    }
    
    func actionSkipButton() {
        let welcome: LoginViewController = LoginViewController()
        navigationController?.pushViewController(welcome, animated: true)
    }
}
