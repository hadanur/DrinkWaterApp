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
}
