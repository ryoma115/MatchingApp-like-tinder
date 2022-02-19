//
//  UIColor-Extension.swift
//  MatchingApp
//
//  Created by N. Ryoma on 2022/02/18.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return .init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
}
