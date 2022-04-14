//
//  TextField.swift
//  Simple
//
//  Created by user on 14.04.2022.
//

import UIKit

class ShiftedWordTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 15, left: 20, bottom: 0, right: 0)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    private var rightImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "hideEye")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    func configure(){
        let view = UIView(frame: CGRect(x: -20, y: 0, width: 20, height: 20))
        rightImageView.frame = view.frame
        view.addSubview(rightImageView)
        rightView = view

        isSecureTextEntry = true
        let gestureRec = UITapGestureRecognizer(target: self, action: #selector(rightTapped))
        rightView!.addGestureRecognizer(gestureRec)
        font = UIFont(name: "Montserrat-Regular", size: 16)
        textColor = UIColor(red: 0.058, green: 0.058, blue: 0.058, alpha: 1)
        autocorrectionType = .no
        autocapitalizationType = .none
        returnKeyType = .default
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0.804, green: 0.855, blue: 0.976, alpha: 1).cgColor
        leftViewMode = .always
        rightViewMode = .always
        backgroundColor = .white
    }
    @objc private func rightTapped(){
        if isSecureTextEntry {
            print("hibih")
            rightImageView.image = UIImage(named: "showEye")
            isSecureTextEntry = false
        } else {
            print("jbi")
            rightImageView.image = UIImage(named: "hideEye")
            isSecureTextEntry = true
        }
    }
}
