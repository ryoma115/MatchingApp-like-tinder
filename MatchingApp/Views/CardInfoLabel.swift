//
//  CardInfoLabel.swift
//  MatchingApp
//
//  Created by N. Ryoma on 2022/02/21.
//

import UIKit

class CardInfoLabel: UILabel {
    init(frame: CGRect = .zero, labelText: String, labelColor: UIColor) {
        super.init(frame: frame)
        
        font = .boldSystemFont(ofSize: 45)
        text = labelText
        textColor = labelColor
        
        layer.borderWidth = 3
        layer.borderColor = labelColor.cgColor
        layer.cornerRadius = 10
        
        textAlignment = .center
        alpha = 0
    }
    
    init(frame: CGRect = .zero, labelText: String, labelFont: UIFont) {
        super.init(frame: frame)
        font = labelFont
        textColor = .white
        text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
