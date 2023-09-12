//
//  Onboarding3ViewController.swift
//  ChallengeOnboarding
//
//  Created by Ellington Cavalcante on 02/09/23.
//

import UIKit

protocol Onboarding3ViewControllerProtocol: AnyObject {
    func actionBeginButton()
}

class Onboarding3ViewController: UIViewController {

    var screen: Onboarding3Screen?
    weak var delegate: Onboarding3ViewControllerProtocol?
    
    override func loadView() {
        screen = Onboarding3Screen()
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

extension Onboarding3ViewController: Onboarding3ScreenProtocol {
    func actionBeginButton() {
        delegate?.actionBeginButton()
    }
}
