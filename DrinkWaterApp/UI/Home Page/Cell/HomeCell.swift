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
    func saveGlassButtonTapped(water: Int, Date: Date)
    func saveBlobButtonTapped(water: Int, Date: Date)
    func saveBigGlassButtonTapped(water: Int, Date: Date)
    func saveBottleWaterButtonTapped(water: Int, Date: Date)
    func saveError()
}

class HomeCell: UITableViewCell {
    @IBOutlet private weak var cellView: UIView!
    @IBOutlet private weak var targetWaterLabel: UILabel!
    @IBOutlet private weak var glassButton: UIButton!
    @IBOutlet private weak var todayDateLabel: UILabel!
    @IBOutlet private weak var blobButton: UIButton!
    @IBOutlet private weak var bigGlassButton: UIButton!
    @IBOutlet private weak var bottleWaterButton: UIButton!
    @IBOutlet weak var todayDrinkedWaterLabel: UILabel!
    
    weak var delegate: HomeCellDelegate?
        
    let currentDateTime = Date()
    let formatter = DateFormatter()

    
    func configure(dailyWaterData: Daily) {
        targetWaterLabel.text = dailyWaterData.ml
        commonInit()
    }
    
    
    
    @IBAction private func glassButtonTapped(_ sender: Any) {
        formatter.timeStyle = .short
        formatter.dateStyle = .long
        formatter.string(from: currentDateTime)
        
        delegate?.saveGlassButtonTapped(water: 200, Date: currentDateTime)
    }
    @IBAction private func blobButtonTapped(_ sender: Any) {
        formatter.timeStyle = .short
        formatter.dateStyle = .long
        formatter.string(from: currentDateTime)
        
        delegate?.saveBlobButtonTapped(water: 180, Date: currentDateTime)
        
    }
    @IBAction private func bigGlassButtonTapped(_ sender: Any) {
        formatter.timeStyle = .short
        formatter.dateStyle = .long
        formatter.string(from: currentDateTime)
        
        delegate?.saveBigGlassButtonTapped(water: 330, Date: currentDateTime)
    }
    
    @IBAction private func bottleWaterButtonTapped(_ sender: Any) {
        formatter.timeStyle = .short
        formatter.dateStyle = .long
        formatter.string(from: currentDateTime)
        
        delegate?.saveBottleWaterButtonTapped(water: 500, Date: currentDateTime)
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
        
        let todayDate = Date()
        let todayDateFormatter = DateFormatter()
        todayDateFormatter.dateStyle = .long
        todayDateFormatter.timeStyle = .none
        todayDateLabel.text = todayDateFormatter.string(from: todayDate)
    }
}
