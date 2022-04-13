//
//  Models.swift
//  Simple
//
//  Created by user on 12.04.2022.
//

import Foundation

enum ProfileModelType {
    case info, switcher, logout
}
struct ProfileModel {
    let viewModelType: ProfileModelType
    let title: String
    let handler: (()->Void)?
}
struct User {
    let name: String
    let email: String
    let imageName: String
    let password: String
}
