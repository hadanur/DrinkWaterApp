//
//  SettingsManager.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 10.10.2023.
//

import Foundation
import UIKit

class SettingsManager {
    static let shared = SettingsManager()
    
    private init() { }
    
    func setSelectedNotificationStyle( notificiation: NotificationType) {
        UserDefaults.standard.set(notificiation.rawValue, forKey: Constants.notificationKey)
    }
    
    func getSelectedNotificationStyle() -> NotificationType {
        guard let selectedOption = NotificationType(rawValue: UserDefaults.standard.string(forKey: Constants.notificationKey) ?? "") else {
            setSelectedNotificationStyle(notificiation: .on)
            return NotificationType.on
        }
        return selectedOption
    }
    
    func getSelectedNotificationName() -> String {
        switch getSelectedNotificationStyle() {
        case .on:
            return NotificationType.on.rawValue
        case .off:
            return NotificationType.off.rawValue
        }
    }
    
    func setSelectedNotificationSoundStyle( sound: NotificationSound) {
        UserDefaults.standard.set(sound.rawValue, forKey: Constants.notificationSoundKey)
    }
    
    func getSelectedNotificationSoundStyle() -> NotificationSound {
        guard let selectedSound = NotificationSound(rawValue: UserDefaults.standard.string(forKey: Constants.notificationSoundKey) ?? "") else {
            setSelectedNotificationSoundStyle(sound: .appSound)
            return NotificationSound.appSound
        }
        return selectedSound
    }
    
    func getSelectedNotificationSoundName() -> String {
        switch getSelectedNotificationSoundStyle() {
        case .appSound:
            return NotificationSound.appSound.rawValue
        case .defaultSound:
            return NotificationSound.defaultSound.rawValue
        }
    }
    
}

enum NotificationType: String {
    case on = "Açık"
    case off = "Kapalı"
    
    func getNotificationFullName(_ notificationType: NotificationType) -> String {
        return self.rawValue
    }
}

enum NotificationSound: String {
    case appSound = "Uygulama Varsayılanı"
    case defaultSound = "Sistem Varsayılanı"
    
    func getNotificationSoundFullName(_ notificationSound: NotificationSound) -> String {
        return self.rawValue
    }
}
