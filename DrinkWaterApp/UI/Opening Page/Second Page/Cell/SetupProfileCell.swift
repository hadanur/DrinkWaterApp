//
//  SetupProfileCell.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 11.09.2023.
//

import Foundation
import UIKit

class SetupProfileCell: UITableViewCell {
    @IBOutlet private weak var setupView: UIView!
    
    func configure() {
        
        UserDefaults.standard.set("opened", forKey: "isFirstOpen")
    }
    
}
