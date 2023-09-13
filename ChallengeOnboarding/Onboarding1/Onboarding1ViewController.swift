//
//  Onboarding1ViewController.swift
//  ChallengeOnboarding
//
//  Created by Ellington Cavalcante on 01/09/23.
//

import UIKit

protocol Onboarding1ViewControllerProtocol: AnyObject {
    func actionOnBoarding1ArrowButton()
    func actionOnBoarding1SkipButton()
}

class Onboarding1ViewController: UIViewController {
    
    var screen: Onboarding1Screen?
    weak var delegate: Onboarding1ViewControllerProtocol?
    
    override func loadView() {
        screen = Onboarding1Screen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension Onboarding1ViewController: Onboarding1ScreenProtocol {
    func actionOnBoardingArrowButton() {
        delegate?.actionOnBoarding1ArrowButton()
    }
    
    func actionOnBoarding1SkipButton() {
        delegate?.actionOnBoarding1SkipButton()
    }
}
