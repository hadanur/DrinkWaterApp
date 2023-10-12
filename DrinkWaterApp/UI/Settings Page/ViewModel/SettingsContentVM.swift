//
//  SettingsContentVM.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 11.10.2023.
//

import Foundation
import UIKit

protocol SettingsContentVMDelegate: AnyObject {
    func selectNotificationStyle()
    func selectNotificationSoundStyle()
}

class SettingsContentVM {
    weak var delegate : SettingsContentVMDelegate?

    func selectNotificationStyle(option: NotificationType) {
        SettingsManager.shared.setSelectedNotificationStyle(notificiation: option)
        delegate?.selectNotificationStyle()
    }
    
    func selectNotificationSoundStyle(option: NotificationSound) {
        SettingsManager.shared.setSelectedNotificationSoundStyle(sound: option)
        delegate?.selectNotificationSoundStyle()
    }
}
