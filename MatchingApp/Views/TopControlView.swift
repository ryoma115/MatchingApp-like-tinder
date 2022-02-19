//
//  TopControlView.swift
//  MatchingApp
//
//  Created by N. Ryoma on 2022/02/15.
//

import UIKit
import RxSwift
import RxCocoa

class TopControlView: UIView {
    
    private let disposeBag = DisposeBag()
    
    let tinderButton = createTopButton(selectImageName: "tinder-selected", unselectedImage: "tinder-unselected")
    let goodButton = createTopButton(selectImageName: "good-selected", unselectedImage: "good-unselected")
    let commentButton = createTopButton(selectImageName:  "comment-selected", unselectedImage: "comment-unselected")
    let profileButton = createTopButton(selectImageName: "profile-selected", unselectedImage: "profile-unselected")
    
    static private func createTopButton(selectImageName: String, unselectedImage: String) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: selectImageName), for: .selected)
        button.setImage(UIImage(named: unselectedImage), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        setupBinding()
        
    }

    private func setupLayout() {
        let baseStackView = UIStackView(arrangedSubviews: [tinderButton,goodButton,commentButton,profileButton])
        baseStackView.axis = .horizontal
        baseStackView.distribution = .fillEqually
        baseStackView.spacing = 43
        baseStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(baseStackView)
        
        baseStackView.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, leftPadding: 40, rightPadding: 40)
        
//        [baseStackView.topAnchor.constraint(equalTo: topAnchor),
//         baseStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
//         baseStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
//         baseStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),
//        ].forEach { $0.isActive = true }
    }
    
    private func setupBinding() {
       
        tinderButton.rx.tap
        //driverとはsubscribeを改造したもの、メインスレッドで動くこと・エラーが出ないことが利点 (buttonを押す動作ではエラーが出ないから)
            .asDriver()
            .drive(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.handleSelectedButton(selectedButton: self.tinderButton)
            })
            .disposed(by: disposeBag)
        goodButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.handleSelectedButton(selectedButton: self.goodButton)
            })
            .disposed(by: disposeBag)
        commentButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.handleSelectedButton(selectedButton: self.commentButton)
            })
            .disposed(by: disposeBag)
        profileButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.handleSelectedButton(selectedButton: self.profileButton)
            })
            .disposed(by: disposeBag)
        
    }
    
    private func handleSelectedButton(selectedButton: UIButton) {
        let buttons = [tinderButton, goodButton, commentButton, profileButton]
        
        buttons.forEach { button in
            if button == selectedButton {
                button.isSelected = true
            } else {
                button.isSelected = false
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
