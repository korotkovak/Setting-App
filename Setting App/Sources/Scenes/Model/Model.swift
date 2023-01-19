//
//  Model.swift
//  Setting App
//
//  Created by Kristina Korotkova on 19/01/23.
//

import Foundation

protocol ModelProtocol {
    var title: String { get }
    var icon: String { get }
    var iconBackgroundColor: String { get }
}

struct Section {
    var options: [SettingsOptionType]
}

enum SettingsOptionType {
    case userCell(model: UserModel)
    case familyCell(model: FamilyModel)
    case defaultCell(model: DefaultModel)
    case switchCell(model: SwitchModel)
    case paymentCell(model: PaymentModel)
}

struct UserModel {
    let title: String
    let subTitle: String
    let imageUserOne: String
}

struct FamilyModel {
    let title: String
    let imageUserOne: String
    let imageUserTwo: String
}

struct DefaultModel: ModelProtocol {
    let title: String
    let subTitle: String?
    let icon: String
    let iconBackgroundColor: String
    let numberIndicator: String?
}

struct SwitchModel: ModelProtocol {
    let title: String
    let isOn: Bool
    let icon: String
    let iconBackgroundColor: String
}

struct PaymentModel {
    let title: String
    let numberInIndicator: String
    let indicatorBackgroundColor: String?
}
