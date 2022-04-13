//
//  NewPassWordViewController.swift
//  Simple
//
//  Created by user on 12.04.2022.
//

import UIKit
import SnapKit
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
}

class NewPassWordViewController: UIViewController {
    private let currentPSWDLabel: UILabel = {
        let label = UILabel()
        label.text = "Текущий пароль"
        label.textColor = UIColor(red: 0.404, green: 0.404, blue: 0.404, alpha: 1)
        label.font = UIFont(name: "Montserrat-Regular", size: 13)
        return label
    }()
    private let currentPSWDField: ShiftedWordTextField = {
        let field = ShiftedWordTextField()
        field.font = UIFont(name: "Montserrat-Regular", size: 16)
        field.textColor = UIColor(red: 0.058, green: 0.058, blue: 0.058, alpha: 1)
        field.placeholder = "Ввести пароль"
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.returnKeyType = .default
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor(red: 0.804, green: 0.855, blue: 0.976, alpha: 1).cgColor
        //        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        let imageView = UIImageView()
        let image = UIImage(named: "hideEye")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        let view = UIView(frame: CGRect(x: -20, y: 0, width: 20, height: 20))
        imageView.frame = view.frame
        view.addSubview(imageView)
        field.rightView = view
        field.leftViewMode = .always
        field.rightViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    private let newPSWDLabel: UILabel = {
        let label = UILabel()
        label.text = "Новый пароль"
        label.textColor = UIColor(red: 0.404, green: 0.404, blue: 0.404, alpha: 1)
        label.font = UIFont(name: "Montserrat-Regular", size: 13)
        return label
    }()
    private let newPSWDField: ShiftedWordTextField = {
        let field = ShiftedWordTextField()
        field.font = UIFont(name: "Montserrat-Regular", size: 16)
        field.textColor = UIColor(red: 0.058, green: 0.058, blue: 0.058, alpha: 1)
        
        field.placeholder = "Ввести пароль"
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.returnKeyType = .default
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor(red: 0.804, green: 0.855, blue: 0.976, alpha: 1).cgColor
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        let imageView = UIImageView()
        let image = UIImage(named: "showEye")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        let view = UIView(frame: CGRect(x: -20, y: 0, width: 20, height: 20))
        imageView.frame = view.frame
        view.addSubview(imageView)
        field.rightView = view
        field.leftViewMode = .always
        field.rightViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    private let repeatPSWDField: UITextField = {
        let field = UITextField()
        
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.returnKeyType = .default
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor(red: 0.804, green: 0.855, blue: 0.976, alpha: 1).cgColor
        field.attributedPlaceholder = NSAttributedString(
            string: "Повторить новый пароль",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.325, green: 0.325, blue: 0.325, alpha: 1)]
        )
        
        field.font = UIFont(name: "Montserrat-Regular", size: 16)
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    private let forgotLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSMutableAttributedString(string: "Забыли пароль ?", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        label.textAlignment = .center
        label.font = UIFont(name: "Montserrat-Regular", size: 14)
        label.textColor = UIColor(red: 0.229, green: 0.229, blue: 0.229, alpha: 1)
        return label
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.804, green: 0.855, blue: 0.976, alpha: 1).cgColor
        button.backgroundColor = .white
        button.setTitle("Сохранить", for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 20)
        button.setTitleColor(UIColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1), for: .normal)
        return button
    }()
    private var scrollView: UIScrollView = {
        let scrv = UIScrollView ()
        scrv.clipsToBounds = true
        return scrv
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.backButtonTitle = ""
        if let navBar = navigationController?.navigationBar as? MyNavC {
            navBar.backLabel.text = "Изменить пароль"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        configure()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    override func viewDidLayoutSubviews() {
        scrollView.frame = view.bounds
    }
    private func configure() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(currentPSWDField)
        
        currentPSWDField.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.height.equalTo(60)
            make.trailing.leading.equalTo(view).inset(20)
        }
        scrollView.addSubview(currentPSWDLabel)
        currentPSWDLabel.snp.makeConstraints { make in
            make.left.equalTo(currentPSWDField).inset(20)
            make.top.equalTo(currentPSWDField).inset(7)
        }
        scrollView.addSubview(newPSWDField)
        newPSWDField.snp.makeConstraints { make in
            make.top.equalTo(currentPSWDField.snp.bottom).offset(20)
            make.height.equalTo(60)
            make.trailing.leading.equalTo(view).inset(20)
        }
        scrollView.addSubview(newPSWDLabel)
        newPSWDLabel.snp.makeConstraints { make in
            make.left.equalTo(newPSWDField).inset(20)
            make.top.equalTo(newPSWDField).inset(7)
        }
        scrollView.addSubview(repeatPSWDField)
        repeatPSWDField.snp.makeConstraints { make in
            make.top.equalTo(newPSWDField.snp.bottom).offset(20)
            make.height.equalTo(60)
            make.trailing.leading.equalTo(view).inset(20)
        }
        
        scrollView.addSubview(forgotLabel)
        forgotLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.top.equalTo(repeatPSWDField.snp.bottom).offset(20)
        }
        scrollView.addSubview(saveButton)
        saveButton.snp.makeConstraints { make in
            make.bottom.equalTo(view).inset(30)
            make.height.equalTo(60)
            make.trailing.leading.equalTo(view).inset(20)
        }
        
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                let height = keyboardSize.height
                self.saveButton.frame.origin.y -= height
        }
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                let height = keyboardSize.height
                self.saveButton.frame.origin.y += height            
        }
    }
    
}
