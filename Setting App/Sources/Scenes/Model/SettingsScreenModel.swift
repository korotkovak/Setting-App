//
//  SettingsScreenModel.swift
//  Setting App
//
//  Created by Kristina Korotkova on 19/01/23.
//

import UIKit

final class SettingsScreenModel {
    var configurations = [
        Section(options: [
            .userCell(model: UserModel(title: Title.user,
                                       subTitle: Subtitle.userSubtitle,
                                       imageUserOne: Icon.userFirst)),
            .familyCell(model: FamilyModel(title: Title.family,
                                           imageUserOne: Icon.userFirst,
                                           imageUserTwo: Icon.userSecond)),
            .paymentCell(model: PaymentModel(title: Title.updatePayment,
                                             numberInIndicator: NumberIndicator.textFive,
                                             indicatorBackgroundColor: Colors.red))
        ]),
        Section(options: [
            .switchCell(model: SwitchModel(title: Title.airplaneMode,
                                           isOn: false,
                                           icon: Icon.airplaneMode,
                                           iconBackgroundColor: Colors.orange)),
            .defaultCell(model: DefaultModel(title: Title.wifi,
                                             subTitle: Subtitle.notConnectedWiFi,
                                             icon: Icon.wifi,
                                             iconBackgroundColor: Colors.blue,
                                             numberIndicator: "")),
            .defaultCell(model: DefaultModel(title: Title.bluetooth,
                                             subTitle: Subtitle.connecterBluetooth,
                                             icon: Icon.bluetooth,
                                             iconBackgroundColor: Colors.blue,
                                             numberIndicator: "")),
            .defaultCell(model: DefaultModel(title: Title.mobileNetwork,
                                             subTitle: "",
                                             icon: Icon.mobileNetwork,
                                             iconBackgroundColor: Colors.green,
                                             numberIndicator: "")),
            .defaultCell(model: DefaultModel(title: Title.modemMode,
                                             subTitle: "",
                                             icon: Icon.modemMode,
                                             iconBackgroundColor: Colors.green,
                                             numberIndicator: "")),
            .switchCell(model: SwitchModel(title: Title.vpn,
                                           isOn: true,
                                           icon: Icon.vpn,
                                           iconBackgroundColor: Colors.blue))
        ]),
        Section(options: [
            .defaultCell(model: DefaultModel(title: Title.notifications,
                                             subTitle: "",
                                             icon: Icon.notifications,
                                             iconBackgroundColor: Colors.red,
                                             numberIndicator: NumberIndicator.textTwentyThree)),
            .defaultCell(model: DefaultModel(title: Title.sounds,
                                             subTitle: "",
                                             icon: Icon.sounds,
                                             iconBackgroundColor: Colors.pink,
                                             numberIndicator: "")),
            .defaultCell(model: DefaultModel(title: Title.focusing,
                                             subTitle: "",
                                             icon: Icon.focusing,
                                             iconBackgroundColor: Colors.indigo,
                                             numberIndicator: "")),
            .defaultCell(model: DefaultModel(title: Title.screenTime,
                                             subTitle: "",
                                             icon: Icon.screenTime,
                                             iconBackgroundColor: Colors.indigo,
                                             numberIndicator: ""))
        ]),
        Section(options: [
            .defaultCell(model: DefaultModel(title: Title.main,
                                             subTitle: "",
                                             icon: Icon.main,
                                             iconBackgroundColor: Colors.gray,
                                             numberIndicator: NumberIndicator.textOne)),
            .defaultCell(model: DefaultModel(title: Title.controlPoint,
                                             subTitle: "",
                                             icon: Icon.controlPoint,
                                             iconBackgroundColor: Colors.gray,
                                             numberIndicator: "")),
            .defaultCell(model: DefaultModel(title: Title.screenAndBrightness,
                                             subTitle: "",
                                             icon: Icon.screenAndBrightness,
                                             iconBackgroundColor: Colors.blue,
                                             numberIndicator: "")),
            .defaultCell(model: DefaultModel(title: Title.universalAccess,
                                             subTitle: "",
                                             icon: Icon.universalAccess,
                                             iconBackgroundColor: Colors.blue,
                                             numberIndicator: "")),
            .defaultCell(model: DefaultModel(title: Title.wallpaper,
                                             subTitle: "",
                                             icon: Icon.wallpaper,
                                             iconBackgroundColor: Colors.blue,
                                             numberIndicator: "")),
            .defaultCell(model: DefaultModel(title: Title.siri,
                                             subTitle: "",
                                             icon: Icon.siri,
                                             iconBackgroundColor: Colors.indigo,
                                             numberIndicator: "")),
            .defaultCell(model: DefaultModel(title: Title.faceId,
                                             subTitle: "",
                                             icon: Icon.faceId,
                                             iconBackgroundColor: Colors.green,
                                             numberIndicator: "")),
            .defaultCell(model: DefaultModel(title: Title.sos,
                                             subTitle: "",
                                             icon: Icon.sos,
                                             iconBackgroundColor: Colors.red,
                                             numberIndicator: "")),
            .defaultCell(model: DefaultModel(title: Title.battery,
                                             subTitle: "",
                                             icon: Icon.battery,
                                             iconBackgroundColor: Colors.green,
                                             numberIndicator: ""))
        ]),
        Section(options: [
            .defaultCell(model: DefaultModel(title: Title.phone,
                                             subTitle: "",
                                             icon: Icon.phone,
                                             iconBackgroundColor: Colors.green,
                                             numberIndicator: "")),
            .defaultCell(model: DefaultModel(title: Title.messages,
                                             subTitle: "",
                                             icon: Icon.messages,
                                             iconBackgroundColor: Colors.green,
                                             numberIndicator: "")),
            .defaultCell(model: DefaultModel(title: Title.faceTime,
                                             subTitle: "",
                                             icon: Icon.faceTime,
                                             iconBackgroundColor: Colors.green,
                                             numberIndicator: ""))
        ]),
        Section(options: [
            .defaultCell(model: DefaultModel(title: Title.photo,
                                             subTitle: "",
                                             icon: Icon.photo,
                                             iconBackgroundColor: Colors.blue,
                                             numberIndicator: "")),
            .defaultCell(model: DefaultModel(title: Title.camera,
                                             subTitle: "",
                                             icon: Icon.camera,
                                             iconBackgroundColor: Colors.gray,
                                             numberIndicator: ""))
        ])
    ]
}

extension SettingsScreenModel {
    enum Colors {
        static let orange = "F09A37"
        static let blue = "3478F6"
        static let green = "65C466"
        static let red = "EA4E3D"
        static let pink = "EA445A"
        static let indigo = "5756CE"
        static let gray = "8E8E92"
    }
    
    enum Title {
        static let user = "Kristina Korotkova"
        static let family = "Cемья"
        static let updatePayment = "Обновите платежный метод"
        
        static let airplaneMode = "Авиарежим"
        static let wifi = "Wi-Fi"
        static let bluetooth = "Bluetooth"
        static let mobileNetwork = "Сотовая связь"
        static let modemMode = "Режим модема"
        static let vpn = "VPN"
        
        static let notifications = "Уведомления"
        static let sounds = "Звуки, тактильные сигналы"
        static let focusing = "Фокусирование"
        static let screenTime = "Экранное время"
        
        static let main = "Основные"
        static let controlPoint = "Пункт управления"
        static let screenAndBrightness = "Экран и яркость"
        static let universalAccess = "Универсальный доступ"
        static let wallpaper = "Обои"
        static let siri = "Siri и поиск"
        static let faceId = "Face ID и код-пароль"
        static let sos = "Экстренный вызов - SOS"
        static let battery = "Аккумулятор"
        
        static let phone = "Телефон"
        static let messages = "Сообщения"
        static let faceTime = "FaceTime"
        static let photo = "Фото"
        static let camera = "Камера"
    }
    
    enum Subtitle {
        static let userSubtitle = "Apple ID, iCloud+, контент и покупки"
        static let notConnectedWiFi = "Не подключено"
        static let connecterBluetooth = "Вкл."
    }
    
    enum Icon {
        static let userFirst = "user0"
        static let userSecond = "user1"
        
        static let airplaneMode = "airplane"
        static let wifi = "wifi"
        static let bluetooth = "bluetooth"
        static let mobileNetwork = "antenna.radiowaves.left.and.right"
        static let modemMode = "personalhotspot"
        static let vpn = "lock.fill"
        
        static let notifications = "bell.badge.fill"
        static let sounds = "speaker.wave.3.fill"
        static let focusing = "moon.fill"
        static let screenTime = "hourglass"
        
        static let main = "gear"
        static let controlPoint = "switch.2"
        static let screenAndBrightness = "textformat.size"
        static let universalAccess = "figure.arms.open"
        static let wallpaper = "wallpaper"
        static let siri = "mic.and.signal.meter.fill"
        static let faceId = "faceid"
        static let sos = "sos"
        static let battery = "battery.75"
        
        static let phone = "phone.fill"
        static let messages = "message.fill"
        static let faceTime = "video.fill"
        static let photo = "photo.on.rectangle.angled"
        static let camera = "camera.fill"
    }
    
    enum NumberIndicator {
        static let textOne = "1"
        static let textTwentyThree = "23"
        static let textFive = "5"
    }
}
