//
//  UIViewController + Extensions.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 20.09.2023.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Tamam", style: .cancel)
        alertController.addAction(okButton)
        present(alertController, animated: true)
    }
    
    func createNotification() {
        let content = UNMutableNotificationContent()
        let notificationType = SettingsManager.shared.getSelectedNotificationSoundStyle()
        
        switch notificationType {
        case .appSound:
            content.sound = UNNotificationSound.default
        case .defaultSound:
            content.sound = UNNotificationSound.default
        }
        
        content.title = "deneme"
        content.body = "deneme"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}
