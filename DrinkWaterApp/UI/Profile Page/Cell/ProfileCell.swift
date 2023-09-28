//
//  ProfileCell.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 12.09.2023.
//

import Foundation
import UIKit

protocol ProfileCellDelegate: AnyObject {
    func resetDailyWaterSuccess()
    func resetDailyWaterError()
}

class ProfileCell: UITableViewCell {
    @IBOutlet private weak var profileView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var genderLabel: UILabel!
    @IBOutlet private weak var weightLabel: UILabel!
    @IBOutlet weak var drinkedWaterLabel: UILabel!
    @IBOutlet private weak var dailyWaterMl: UILabel!
    @IBOutlet private weak var changeDailyWaterButton: UIButton!
    
    weak var delegate: ProfileCellDelegate?
    
    func configure(userData: User, dailyWaterData: Daily) {
        nameLabel.text = userData.name
        if userData.gender == true {
            genderLabel.text = "Erkek"
        } else {
            genderLabel.text = "Kadın"
        }
        weightLabel.text = (String(describing: userData.weight)) + " kg"
        dailyWaterMl.text = dailyWaterData.ml
        
        changeDailyWaterButton.layer.cornerRadius = 22
        changeDailyWaterButton.clipsToBounds = false
        changeDailyWaterButton.layer.shadowOpacity = 0.4
        changeDailyWaterButton.layer.shadowOffset = CGSizeMake(1, 2)
        changeDailyWaterButton.layer.shadowColor = UIColor.link.cgColor
        
    }
    
    @IBAction private func changeDailyWaterButtonTapped(_ sender: Any) {
        delegate?.resetDailyWaterSuccess()
    }
}
