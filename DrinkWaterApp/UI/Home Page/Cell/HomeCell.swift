//
//  HomeCell.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 11.09.2023.
//

import Foundation
import UIKit

protocol HomeCellDelegate: AnyObject {
    func toNavigateAddWaterVC()
}

class HomeCell: UITableViewCell {
    @IBOutlet private weak var cellView: UIView!
    @IBOutlet private weak var targetWaterLabel: UILabel!
    @IBOutlet private weak var glassButton: UIButton!
    @IBOutlet private weak var todayDateLabel: UILabel!
    @IBOutlet private weak var blobButton: UIButton!
    @IBOutlet private weak var bigGlassButton: UIButton!
    @IBOutlet private weak var bottleWaterButton: UIButton!
    
    weak var delegate: HomeCellDelegate?
    
    func configure(dailyWaterData: Daily) {
        targetWaterLabel.text = dailyWaterData.ml
        commonInit()
    }
    
    @IBAction private func glassButtonTapped(_ sender: Any) {
        
    }
    @IBAction private func blobButtonTapped(_ sender: Any) {
        
    }
    @IBAction private func bigGlassButtonTapped(_ sender: Any) {
    }
    
    @IBAction private func bottleWaterButtonTapped(_ sender: Any) {
    }
    
    private func commonInit() {
        
        blobButton.layer.cornerRadius = 22
        blobButton.clipsToBounds = false
        blobButton.layer.shadowOpacity = 0.4
        blobButton.layer.shadowOffset = CGSizeMake(1, 2)
        blobButton.layer.shadowColor = UIColor.link.cgColor
        
        glassButton.layer.cornerRadius = 22
        glassButton.clipsToBounds = false
        glassButton.layer.shadowOpacity = 0.4
        glassButton.layer.shadowOffset = CGSizeMake(1, 2)
        glassButton.layer.shadowColor = UIColor.link.cgColor
        
        bottleWaterButton.layer.cornerRadius = 22
        bottleWaterButton.clipsToBounds = false
        bottleWaterButton.layer.shadowOpacity = 0.4
        bottleWaterButton.layer.shadowOffset = CGSizeMake(1, 2)
        bottleWaterButton.layer.shadowColor = UIColor.link.cgColor
        
        bigGlassButton.layer.cornerRadius = 22
        bigGlassButton.clipsToBounds = false
        bigGlassButton.layer.shadowOpacity = 0.4
        bigGlassButton.layer.shadowOffset = CGSizeMake(1, 2)
        bigGlassButton.layer.shadowColor = UIColor.link.cgColor
    }
}
