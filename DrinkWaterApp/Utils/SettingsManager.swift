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
    
}

enum NotificationType: String {
    case on = "Açık"
    case off = "Kapalı"
    
    func getNotificationFullName(_ notificationType: NotificationType) -> String {
        return self.rawValue
    }
}
