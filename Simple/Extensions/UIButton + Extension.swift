//
//  UIButton + Extension.swift
//  Simple
//
//  Created by user on 14.04.2022.
//

import UIKit

extension UIButton {
    func configure(title: String) {
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0.804, green: 0.855, blue: 0.976, alpha: 1).cgColor
        backgroundColor = .white
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 20)
        setTitleColor(UIColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1), for: .normal)
    }
}
