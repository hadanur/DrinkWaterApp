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
    
    
    func configure(data: User) {
        nameLabel.text = data.name
        if data.gender == true {
            genderLabel.text = "Erkek"
        } else {
            genderLabel.text = "Kadın"
        }
        weightLabel.text = (String(describing: data.weight)) + " kg"
    }
    
}
