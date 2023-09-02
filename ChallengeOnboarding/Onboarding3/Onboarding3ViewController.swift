//
//  Onboarding3ViewController.swift
//  ChallengeOnboarding
//
//  Created by Ellington Cavalcante on 02/09/23.
//

import UIKit

class Onboarding3ViewController: UIViewController {

    var screen: Onboarding3Screen?
    
    override func loadView() {
        screen = Onboarding3Screen()
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

    }
    
    @objc func swipeFuncRight(_ gesture: UIGestureRecognizer) {
        navigationController?.popViewController(animated: true)
    }
}

extension Onboarding3ViewController: Onboarding3ScreenProtocol {
    func actionBeginButton() {
        let welcome: LoginViewController = LoginViewController()
        navigationController?.pushViewController(welcome, animated: true)
    }
}
