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
}

class SettingsContentVM {
    weak var delegate : SettingsContentVMDelegate?

    func selectNotificationStyle(option: NotificationType) {
        SettingsManager.shared.setSelectedNotificationStyle(notificiation: option)
        delegate?.selectNotificationStyle()
    }
}
