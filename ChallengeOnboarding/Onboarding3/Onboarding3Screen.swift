//
//  Onboarding3Screen.swift
//  ChallengeOnboarding
//
//  Created by Ellington Cavalcante on 02/09/23.
//

import UIKit

protocol Onboarding3ScreenProtocol: AnyObject {
    func actionBeginButton()
}

class Onboarding3Screen: UIView {
    
    weak var delegate: Onboarding3ScreenProtocol?
    
    private lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 93/255, green: 211/255, blue: 158/255, alpha: 1.0)
        return view
    }()
    
    private lazy var topImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "imagem3")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Conquiste mais, se preocupe menos."
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Com o nosso app, suas tarefas viram \nconquistas. Acompanhe seu progresso, marque itens concluídos e sinta a satisfação de ver suas metas se tornarem realidade. Este é o começo de uma jornada mais produtiva e realizadora!"
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    public lazy var beginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("COMEÇAR", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 22.0
        button.backgroundColor = UIColor(red: 93/255, green: 211/255, blue: 158/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedbeginButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedbeginButton() {
        delegate?.actionBeginButton()
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
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(beginButton)
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
            
            topImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            topImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            
            titleLabel.topAnchor.constraint(equalTo: beginButton.topAnchor, constant: -200),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            subTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            
            beginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            beginButton.topAnchor.constraint(equalTo: bottomAnchor, constant: -97),
            beginButton.heightAnchor.constraint(equalToConstant: 44),
            beginButton.widthAnchor.constraint(equalToConstant: 167),
            
        ])
    }
}
