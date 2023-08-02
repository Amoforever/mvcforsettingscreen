//
//  ModelForSettingScreen.swift
//  mvcforsettingscreen
//
//  Created by Amahastla on 02.08.2023.
//

import UIKit

final class OnboardingModelOfSettingScreen {
    
    static var allModelsOnSettingScreen: [[Onboarding]] {
        return [
            [
                Onboarding(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconColor: .systemOrange, isOn: true),
                Onboarding(title: "Wi-Fi", icon: UIImage(systemName: "wifi.square.fill"), iconColor: .systemBlue, additionalInfo: "Не подключено"),
                Onboarding(title: "Bluetooth", icon: UIImage(systemName: "bonjour"), iconColor: .systemBlue, additionalInfo: "Вкл."),
                Onboarding(title: "Сотовая связь", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconColor: .systemGreen),
                Onboarding(title: "Режим модема", icon: UIImage(systemName: "personalhotspot"), iconColor: .systemGreen),
                Onboarding(title: "VPN", icon: UIImage(systemName: "lock.shield"), iconColor: .systemBlue, isOn: true)
            ],
            [
                Onboarding(title: "Уведомления", icon: UIImage(systemName: "bell.badge.circle.fill"), iconColor: .systemRed),
                Onboarding(title: "Звуки, тактильные сигналы", icon: UIImage(systemName: "speaker.wave.2.circle.fill"), iconColor: .systemPink),
                Onboarding(title: "Не беспокоить", icon: UIImage(systemName: "moon.circle.fill"), iconColor: .systemBlue),
                Onboarding(title: "Экранное время", icon: UIImage(systemName: "hourglass.circle.fill"), iconColor: .systemBlue)
            ],
            [
                Onboarding(title: "Основные", icon: UIImage(systemName: "gear"), iconColor: .gray, alertSign: UIImage(systemName: "exclamationmark.circle.fill")),
                Onboarding(title: "Пункт управления", icon: UIImage(systemName: "switch.2"), iconColor: .gray),
                Onboarding(title: "Экран и яркость", icon: UIImage(systemName: "textformat.size"), iconColor: .systemBlue),
                Onboarding(title: "Экран «Домой»", icon: UIImage(systemName: "house.circle.fill"), iconColor: .systemBlue),
                
            ]
        ]
    }
}

struct Onboarding {
    var title: String
    var icon: UIImage?
    var iconColor: UIColor
    var additionalInfo: String?
    var alertSign: UIImage?
    var isOn: Bool?
}



