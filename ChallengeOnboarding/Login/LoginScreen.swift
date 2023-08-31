//
//  LoginScreen.swift
//  ChallengeOnboarding
//
//  Created by Ellington Cavalcante on 30/08/23.
//

import UIKit

class LoginScreen: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func backgroundColor() {
        backgroundColor = .red
    }
    
    private func addSubview() {
        backgroundColor()
    }
    
}
