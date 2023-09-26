//
//  ProfileCell.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 12.09.2023.
//

import Foundation
import UIKit

class ProfileCell: UITableViewCell {
    @IBOutlet private weak var profileView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var genderLabel: UILabel!
    @IBOutlet private weak var weightLabel: UILabel!
    @IBOutlet weak var drinkedWaterLabel: UILabel!
    
    
    func configure(userData: User) {
        nameLabel.text = userData.name
        if userData.gender == true {
            genderLabel.text = "Erkek"
        } else {
            genderLabel.text = "Kadın"
        }
        weightLabel.text = (String(describing: userData.weight)) + " kg"
        
    }
    
}
