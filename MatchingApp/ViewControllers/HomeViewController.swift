//
//  ViewController.swift
//  MatchingApp
//
//  Created by N. Ryoma on 2022/02/14.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let topControlView = TopControlView()
        let mainControlView = CardView()
        let bottomControlView = BottomControlView()
        
        let stackView = UIStackView(arrangedSubviews: [topControlView, mainControlView, bottomControlView])
        //xcode独自のautolayoutを使うか使わないか
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
        self.view.addSubview(stackView)
        
        topControlView.anchor(height: 100)
        bottomControlView.anchor(height: 120)
        
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor)
        
//        [
//            topContorlView.heightAnchor.constraint(equalToConstant: 100),
//            bottomControlView.heightAnchor.constraint(equalToConstant: 120),
//
//            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
//            stackView.rightAnchor.constraint(equalTo: view.rightAnchor)]
//            .forEach { $0.isActive = true }
        
        
        // Do any additional setup after loading the view.
    }


}

