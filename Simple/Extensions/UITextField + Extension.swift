//
//  UITextField + Extension.swift
//  Simple
//
//  Created by user on 14.04.2022.
//

import Foundation
import UIKit

extension UITextField {
    func passwordStyle(placeholder: String){
        attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.325, green: 0.325, blue: 0.325, alpha: 1)]
        )
        autocorrectionType = .no
        autocapitalizationType = .none
        returnKeyType = .default
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0.804, green: 0.855, blue: 0.976, alpha: 1).cgColor
        font = UIFont(name: "Montserrat-Regular", size: 16)
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        leftViewMode = .always
        backgroundColor = .white
        isSecureTextEntry = false
    }
}
