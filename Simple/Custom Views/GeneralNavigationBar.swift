//
//  MyNavBar.swift
//  Simple
//
//  Created by user on 13.04.2022.
//

import UIKit

class GeneralNavigationBar: UINavigationBar {
    
    public var backLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.217, green: 0.217, blue: 0.217, alpha: 1)
        label.font = UIFont(name:"Montserrat-Medium", size: 18)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backLabel)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        backLabel.frame = CGRect(x: 90, y: 0, width: frame.width-90, height: frame.height)
    }
}
