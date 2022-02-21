//
//  CardView.swift
//  MatchingApp
//
//  Created by N. Ryoma on 2022/02/17.
//

import UIKit

class CardView: UIView {
    let cardImageView: UIImageView = {
       let iv = UIImageView()
        iv.backgroundColor = .blue
        iv.layer.cornerRadius = 10
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "自分")
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 40, weight: .heavy)
        label.textColor = .white
        label.text = "Taro, 22"
        return label
    }()
    
    let infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "info.circle.fill")?.resize(size: .init(width: 40, height: 40)), for: .normal)
        button.tintColor = .white
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    private let residenceLabel = CardInfoLabel(labelText: "日本、大阪", labelFont: .systemFont(ofSize: 20, weight: .regular))
//    let residenceLabel: UILabel = {
//        let label = UILabel()
//        label.font = .systemFont(ofSize: 20, weight: .regular)
//        label.textColor = .white
//        label.text = "日本、大阪"
//        return label
//    }()
    
    private let hobbyLabel = CardInfoLabel(labelText: "ランニング", labelFont: .systemFont(ofSize: 25, weight: .regular))
//    let hobbyLabel: UILabel = {
//        let label = UILabel()
//        label.font = .systemFont(ofSize: 25, weight: .regular)
//        label.textColor = .white
//        label.text = "ランニング"
//        return label
//    }()
    
    private let introductionLabel = CardInfoLabel(labelText: "走り回るのが大好きです", labelFont: .systemFont(ofSize: 25, weight: .regular))
//    let introductionLabel: UILabel = {
//        let label = UILabel()
//        label.font = .systemFont(ofSize: 25, weight: .regular)
//        label.textColor = .white
//        label.text = "走り回るのが大好きです"
//        return label
//    }()
    
    private let goodLabel = CardInfoLabel(labelText: "GOOD", labelColor: .rgb(red: 137, green: 223, blue: 86))
    private let nopeLabel = CardInfoLabel(labelText: "NOPE", labelColor: .rgb(red: 222, green: 110, blue: 110))
//    ex)
//    let hogeLabel: UILabel = {
//       let label = UILabel()
//        label.text = "HOGE"
//        label.layer.cornerRadius = 10
//        return label
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panCardView))
        self.addGestureRecognizer(panGesture)
        
    }
    
    @objc private func panCardView(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self)
        
        if gesture.state == .changed {
            handlePanChange(translation: translation)
        } else if gesture.state == .ended {
            self.handlePanEnded()
        }
    }
    
    private func handlePanChange(translation: CGPoint) {
        let degree: CGFloat = translation.x / 20
        let angle = degree * CGFloat.pi / 100
        
        let rotateTranslation = CGAffineTransform(rotationAngle: angle)
        self.transform = rotateTranslation.translatedBy(x: translation.x, y: translation.y)
        //UIを動かすだけ
//        self.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
        
        let ratio: CGFloat = 1 / 100
        let ratioValue = ratio * translation.x
        
        if translation.x > 0 {
            self.goodLabel.alpha = ratioValue
        } else if translation.x < 0 {
            self.nopeLabel.alpha = -ratioValue
        }
        
    }
    
    private func handlePanEnded() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.7, options: []) {
            self.transform = .identity
            self.layoutIfNeeded()
            
            self.goodLabel.alpha = 0
            self.nopeLabel.alpha = 0
        }
    }
    
    private func setupLayout() {
        
        let infoVerticalStackView = UIStackView(arrangedSubviews: [residenceLabel, hobbyLabel, introductionLabel])
        infoVerticalStackView.axis = .vertical
        
        let baseStackView = UIStackView(arrangedSubviews: [infoVerticalStackView, infoButton])
        baseStackView.axis = .horizontal
        
        addSubview(cardImageView)
        addSubview(nameLabel)
        addSubview(baseStackView)
        addSubview(goodLabel)
        addSubview(nopeLabel)
        cardImageView.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, leftPadding: 10, rightPadding: 10)
        infoButton.anchor(width: 40)
        nameLabel.anchor(bottom: baseStackView.topAnchor, left: cardImageView.leftAnchor, bottomPadding: 20, leftPadding: 20)
        baseStackView.anchor(bottom: cardImageView.bottomAnchor, left: cardImageView.leftAnchor, right: cardImageView.rightAnchor, bottomPadding: 20, leftPadding: 20, rightPadding: 20)
        goodLabel.anchor(top: cardImageView.topAnchor, left: cardImageView.leftAnchor, width: 140, height: 55, topPadding: 25, leftPadding: 20)
        nopeLabel.anchor(top: cardImageView.topAnchor, right: cardImageView.rightAnchor, width: 140, height: 55, topPadding: 25, rightPadding: 20)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
