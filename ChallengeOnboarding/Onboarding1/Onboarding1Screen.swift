//
//  Onboarding1Screen.swift
//  ChallengeOnboarding
//
//  Created by Ellington Cavalcante on 01/09/23.
//

import UIKit

protocol Onboarding1ScreenProtocol: AnyObject {
    func actionOnBoarding1SkipButton()
    func actionOnBoardingArrowButton()
}

class Onboarding1Screen: UIView {
    
    weak var delegate: Onboarding1ScreenProtocol?
    
    private lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 52/255, green: 138/255, blue: 167/255, alpha: 1.0)
        return view
    }()
    
    private lazy var topImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "imagem1")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    public lazy var skipButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("pular", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(UIColor(red: 232/255, green: 247/255, blue: 252/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(tappedskipButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedskipButton() {
        delegate?.actionOnBoarding1SkipButton()
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Explore uma nova forma de \norganizar sua vida."
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Descubra como nosso aplicativo pode ajudar \nvocê a planejar, acompanhar e concluir suas \ntarefas de maneira mais eficiente. Prepare-se \npara uma experiência incrível de produtividade!"
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
        delegate?.actionOnBoardingArrowButton()
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
            view.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -25),
            
            skipButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            skipButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            topImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            topImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 65),
            topImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -65),
            topImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            
            titleLabel.topAnchor.constraint(equalTo: arrowButton.topAnchor, constant: -200),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            subTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            
            arrowButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            arrowButton.topAnchor.constraint(equalTo: bottomAnchor, constant: -97),
            arrowButton.heightAnchor.constraint(equalToConstant: 44),
            arrowButton.widthAnchor.constraint(equalToConstant: 44),
            
        ])
    }
}
