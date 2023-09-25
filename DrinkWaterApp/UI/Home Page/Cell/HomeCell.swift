//
//  HomeCell.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 11.09.2023.
//

import Foundation
import UIKit

class HomeCell: UITableViewCell {
    @IBOutlet private weak var cellView: UIView!
    @IBOutlet private weak var targetWaterLabel: UILabel!
    
    func configure(dailyWaterData: Daily) {
        targetWaterLabel.text = dailyWaterData.ml
    }
    
}
