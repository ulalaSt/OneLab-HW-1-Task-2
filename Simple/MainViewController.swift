//
//  MainViewController.swift
//  Simple
//
//  Created by user on 12.04.2022.
//

import UIKit

class MainViewController: UIViewController {
    let profButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.178, green: 0.376, blue: 0.887, alpha: 1)
        button.setTitle("Нажмите", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.backButtonTitle = ""
        if let navBar = navigationController?.navigationBar as? MyNavC {
            navBar.backLabel.text = ""
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profButton)
        profButton.addTarget(self, action: #selector(profClicked), for: .touchUpInside)
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.tintColor = UIColor(red: 0.178, green: 0.376, blue: 0.887, alpha: 1)
    }
    override func viewDidLayoutSubviews() {
        profButton.frame = view.frame
    }
    
    @objc private func profClicked() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: false)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
