//
//  StatsCell.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 1.10.2023.
//

import Foundation
import UIKit

class StatsCell: UITableViewCell {
    @IBOutlet private weak var statsView: UIView!
    @IBOutlet private weak var waterMlLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var waterImageView: UIImageView!
    
    func configure(data: AddingWater) {
        statsView.layer.cornerRadius = 22
        statsView.clipsToBounds = false
        statsView.layer.shadowOpacity = 0.4
        statsView.layer.shadowOffset = CGSizeMake(1, 2)
        statsView.layer.shadowColor = UIColor.link.cgColor
        
        let dataTime = data.date
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        formatter.string(from: dataTime)
        
        dateLabel.text = formatter.string(from: dataTime)
        waterMlLabel.text = "\(data.water)" + " Ml"
        
        if data.water == 180 {
            waterImageView.image = UIImage(named: "180")
        } else if data.water == 200 {
            waterImageView.image = UIImage(named: "200")
        } else if data.water == 330 {
            waterImageView.image = UIImage(named: "330")
        } else {
            waterImageView.image = UIImage(named: "500")
        }
    }
    
}
