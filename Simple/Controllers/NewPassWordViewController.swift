//
//  NewPassWordViewController.swift
//  Simple
//
//  Created by user on 12.04.2022.
//

import UIKit
import SnapKit

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
        field.placeholder = "Ввести пароль"
        field.configure()
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
        field.placeholder = "Ввести пароль"
        field.configure()
        return field
    }()
    
    private let repeatPSWDField: UITextField = {
        let field = UITextField()
        field.passwordStyle(placeholder: "Повторить новый пароль")
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
        button.configure(title: "Сохранить")
        return button
    }()
    private var scrollView: UIScrollView = {
        let scrv = UIScrollView ()
        scrv.clipsToBounds = true
        return scrv
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.backButtonTitle = ""
        if let navBar = navigationController?.navigationBar as? GeneralNavigationBar {
            navBar.backLabel.text = "Изменить пароль"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        configure()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillHideNotification, object: nil)
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
        currentPSWDField.delegate = self
        
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
        newPSWDField.delegate = self
        
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
        repeatPSWDField.delegate = self
        
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
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let height = keyboardSize.height
            saveButton.frame.origin.y = view.frame.maxY-150-height
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let height = keyboardSize.height
            saveButton.frame.origin.y = view.frame.maxY-90-height
        }
    }
}
extension NewPassWordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == currentPSWDField {
           textField.resignFirstResponder()
           newPSWDField.becomeFirstResponder()
        } else if textField == newPSWDField {
           newPSWDField.resignFirstResponder()
           repeatPSWDField.becomeFirstResponder()
        } else if textField == repeatPSWDField {
            repeatPSWDField.resignFirstResponder()
        }
       return true
    }
}
