//
//  Onboarding2ViewController.swift
//  ChallengeOnboarding
//
//  Created by Ellington Cavalcante on 02/09/23.
//

import UIKit

protocol Onboarding2ViewControllerProtocol: AnyObject {
    func actionOnBoarding2ArrowButton()
    func actionOnBoarding2SkipButton()
}

class Onboarding2ViewController: UIViewController {

    var screen: Onboarding2Screen?
    weak var delegate: Onboarding2ViewControllerProtocol?
    
    override func loadView() {
        screen = Onboarding2Screen()
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

extension Onboarding2ViewController: Onboarding2ScreenProtocol {
    func actionArrowButton() {
        delegate?.actionOnBoarding2ArrowButton()
    }

    func actionSkipButton() {
        delegate?.actionOnBoarding2SkipButton()
    }
}
