//
//  LoginScreen.swift
//  ChallengeOnboarding
//
//  Created by Ellington Cavalcante on 30/08/23.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func actionRegisterButton()
    func actionSignInButton()

}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    func delegate(delegate: LoginScreenProtocol?) {
        self.delegate = delegate
    }
    
    public lazy var scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private lazy var conteinerView: UIView = {
        let conteiner = UIView()
        conteiner.translatesAutoresizingMaskIntoConstraints = false
        return conteiner
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Organize sua \nvida com facilidade e \neficiência."
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 42)
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Antes de começar a aproveitar todos os benefícios do nosso aplicativo, faça login ou crie uma conta para desbloquear todas as funcionalidades e otimizar sua rotina diária."
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    public lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CRIAR CONTA", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 23.5
        button.backgroundColor = UIColor(red: 93/255, green: 211/255, blue: 158/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedRegisterButton() {
        delegate?.actionRegisterButton()
    }
    
    public lazy var signInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ENTRAR", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(UIColor(red: 93/255, green: 211/255, blue: 158/255, alpha: 1.0), for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 23.5
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor(red: 93/255, green: 211/255, blue: 158/255, alpha: 1.0).cgColor
        button.backgroundColor = UIColor(red: 232/255, green: 247/255, blue: 252/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedSignInButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedSignInButton() {
        delegate?.actionSignInButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func backgroundColor() {
        backgroundColor = UIColor(red: 232/255, green: 247/255, blue: 252/255, alpha: 1.0)
    }
    
    private func addSubview() {
        addSubview(scroll)
        scroll.addSubview(conteinerView)
        conteinerView.addSubview(titleLabel)
        conteinerView.addSubview(subTitleLabel)
        conteinerView.addSubview(registerButton)
        conteinerView.addSubview(signInButton)
        backgroundColor()
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            scroll.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            scroll.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            conteinerView.topAnchor.constraint(equalTo: scroll.topAnchor),
            conteinerView.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            conteinerView.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            conteinerView.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            conteinerView.heightAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.heightAnchor),
            conteinerView.widthAnchor.constraint(equalTo: scroll.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 6),
            titleLabel.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 22),
            titleLabel.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -22),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 22),
            subTitleLabel.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 22),
            subTitleLabel.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -22),
            
            registerButton.bottomAnchor.constraint(equalTo: conteinerView.bottomAnchor, constant: -103),
            registerButton.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 71),
            registerButton.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -71),
            registerButton.heightAnchor.constraint(equalToConstant: 44),
            
            signInButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 12),
            signInButton.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 71),
            signInButton.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -71),
            signInButton.heightAnchor.constraint(equalToConstant: 44),

        ])
    }
}
