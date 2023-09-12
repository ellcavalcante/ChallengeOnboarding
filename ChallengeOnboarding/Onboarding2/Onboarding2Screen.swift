//
//  Onboarding2Screen.swift
//  ChallengeOnboarding
//
//  Created by Ellington Cavalcante on 02/09/23.
//

import UIKit

protocol Onboarding2ScreenProtocol: AnyObject {
    func actionSkipButton()
    func actionArrowButton()
}

class Onboarding2Screen: UIView {
    
    weak var delegate: Onboarding2ScreenProtocol?
    
    private lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 232/255, green: 247/255, blue: 252/255, alpha: 1.0)
        return view
    }()
    
    private lazy var topImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "imagem2")
        return image
    }()
    
    public lazy var skipButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("pular", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(UIColor(red: 82/255, green: 81/255, blue: 116/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(tappedskipButton), for: .touchUpInside)
        return button
    }()

    @objc func tappedskipButton() {
        delegate?.actionSkipButton()
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Simplifique seu dia a dia."
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Com nosso app, você pode criar listas de \ntarefas personalizadas, definir prioridades e \nnunca mais perder um prazo. Chega de \nconfusão! Deixe-nos ajudar a tornar suas \natividades diárias mais organizadas e \ntranquilas."
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    public lazy var arrowButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "icon-arrow-right"), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 22.0
        button.backgroundColor = UIColor(red: 93/255, green: 211/255, blue: 158/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedArrowButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedArrowButton() {
        delegate?.actionArrowButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubview() {
        addSubview(view)
        addSubview(topImageView)
        addSubview(skipButton)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(arrowButton)
        setUpConstraints()
        backgroundColor()
    }
    
    private func backgroundColor() {
        backgroundColor = .white
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            view.heightAnchor.constraint(equalToConstant: 530),
            
            skipButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            skipButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
        
            topImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30),
            
            titleLabel.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 22),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            subTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            
            arrowButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            arrowButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            arrowButton.heightAnchor.constraint(equalToConstant: 44),
            arrowButton.widthAnchor.constraint(equalToConstant: 44),

        ])
    }
    
}
