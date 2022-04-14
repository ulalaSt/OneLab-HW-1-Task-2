//
//  ViewModels.swift
//  Simple
//
//  Created by user on 12.04.2022.
//

import Foundation
class ProfileViewModel {
    static let data = User(name: "Мария Атрисова",
                           email: "maria.atrisova@gmail.com",
                           imageName: "profileImage",
                           password: "Qwerty123")
    let settings: [ProfileModel] = [
        ProfileModel(viewModelType: .switcher,
                     title: "Push уведомления",
                     handler: nil),
        ProfileModel(viewModelType: .info,
                     title: "Изменить пароль",
                     handler: nil),
        ProfileModel(viewModelType: .info,
                     title: "Изменить код быстрого доступа",
                     handler: nil),
        ProfileModel(viewModelType: .switcher,
                     title: "Вход c Face/Touch ID",
                     handler: nil),
        ProfileModel(viewModelType: .info,
                     title: "Изменить номер телефона",
                     handler: nil),
        ProfileModel(viewModelType: .logout,
                     title: "Выход",
                     handler: nil)
    ]
}
