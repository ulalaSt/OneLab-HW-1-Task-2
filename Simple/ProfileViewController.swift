//
//  ViewController.swift
//  Task-2
//
//  Created by user on 11.04.2022.
//

import UIKit
import SnapKit
class ProfileViewController: UIViewController {
    
    private let viewModel = ProfileViewModel()
    
    private var tableView: UITableView = {
        let table = UITableView()
        table.register(GeneralTableViewCell.self, forCellReuseIdentifier: GeneralTableViewCell.identifier)
        return table
    }()
    private var imageV = UIImageView(image: UIImage(named: ProfileViewModel.data.imageName))
    private var newImageV = UIImageView(image: UIImage(named: "newImage"))
    private var imageBG = UIImageView(image: UIImage(named: ProfileViewModel.data.imageName))
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.217, green: 0.217, blue: 0.217, alpha: 1)
        label.font = UIFont(name: "Montserrat-SemiBold", size: 19)
        return label
    }()
    private var emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Regular", size: 16)
        label.textColor = UIColor(red: 0.371, green: 0.371, blue: 0.371, alpha: 1)
        return label
    }()

    private var headerV: UIView = {
        let view = UIView()
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        modifyHeader()
    }
    private func modifyHeader() {
        headerV.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        headerV.addSubview(imageBG)
        headerV.addSubview(imageV)
        headerV.addSubview(newImageV)
        imageV.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.size.equalTo(100)
        }
        imageBG.snp.makeConstraints { make in
            make.centerY.equalTo(imageV)
            make.centerX.equalTo(imageV)
            make.size.equalTo(102)
        }
        newImageV.snp.makeConstraints { make in
            make.bottom.equalTo(imageV).inset(3)
            make.right.equalTo(imageV)
            make.size.equalTo(36)
        }
        
        nameLabel.text = ProfileViewModel.data.name
        headerV.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageV.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }

        emailLabel.text = ProfileViewModel.data.email
        headerV.addSubview(emailLabel)
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        tableView.tableHeaderView = headerV
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.backButtonTitle = ""
        if let navBar = navigationController?.navigationBar as? MyNavC {
            navBar.backLabel.text = "Профиль"
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.frame

        imageBG.layer.cornerRadius = imageBG.frame.width/2
        imageBG.layer.borderColor = UIColor(red: 0.279, green: 0.279, blue: 0.279, alpha: 1).cgColor
        imageBG.layer.borderWidth = 3
        imageBG.layer.masksToBounds = true

        imageV.layer.cornerRadius = imageV.frame.width/2
        imageV.layer.borderColor = UIColor.white.cgColor
        imageV.layer.borderWidth = 3
        imageV.layer.masksToBounds = true
    }
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GeneralTableViewCell.identifier, for: indexPath) as! GeneralTableViewCell
        cell.setUp(with: viewModel.settings[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.settings.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = viewModel.settings[indexPath.row]
        switch model.viewModelType {
        case .info:
            if model.title == "Изменить пароль" {
                let newPassC = NewPassWordViewController()
                navigationController?.pushViewController(newPassC, animated: true)
            }
        case .switcher:
            break
        case .logout:
            print("Logged Out")
        }
    }
}
