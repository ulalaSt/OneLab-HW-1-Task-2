//
//  GeneralTableViewCell.swift
//  Simple
//
//  Created by user on 12.04.2022.
//

import UIKit
import SnapKit

class GeneralTableViewCell: UITableViewCell {

    static let identifier = "GeneralTableViewCell"
    
    private var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Regular", size: 19)
        label.textColor = UIColor(red: 0.325, green: 0.325, blue: 0.325, alpha: 1)
        return label
    }()
    
    var switcher = UISwitch()
    
    func setUp(with model: ProfileModel) {
        label.text = model.title
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20)
            make.height.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalToSuperview()
        }
        switch model.viewModelType {
        case .info:
            accessoryType = .disclosureIndicator
        case .switcher:
            contentView.addSubview(switcher)
            switcher.onTintColor = UIColor(red: 0.178, green: 0.376, blue: 0.887, alpha: 1)
            switcher.snp.makeConstraints { make in
                make.right.equalToSuperview().inset(20)
                make.centerY.equalToSuperview()
            }
        case .logout:
            label.textColor = UIColor(red: 1, green: 0.317, blue: 0.317, alpha: 1)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
