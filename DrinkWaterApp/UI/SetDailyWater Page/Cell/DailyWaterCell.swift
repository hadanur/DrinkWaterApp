//
//  DailyWaterCell.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 24.09.2023.
//

import Foundation
import UIKit

protocol DailyWaterCellDelegate: AnyObject {
    func saveButtonTapped(ml: String)
    func emptyInputsError()
}

class DailyWaterCell: UITableViewCell {
    @IBOutlet private weak var dailyWaterView: UIView!
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var saveButton: UIButton!
    @IBOutlet private weak var setMlView: UIView!
    @IBOutlet private weak var mlLabel: UILabel!
    @IBOutlet private weak var selectButton: UIButton!
    
    weak var delegate: DailyWaterCellDelegate?
    
    func configure() {
        commonInit()
    }
    
    @IBAction private func saveButtonTapped(_ sender: Any) {
        guard let ml = textView.text else { delegate?.emptyInputsError(); return }
        
        if textView.text != "" {
            delegate?.saveButtonTapped(ml: ml)
        } else {
            delegate?.emptyInputsError()
        }
    }
    
    @IBAction func recommendedWaterTapped(_ sender: Any) {
        guard let ml = mlLabel.text else { delegate?.emptyInputsError(); return }
        delegate?.saveButtonTapped(ml: ml)
    }
    
    private func commonInit() {
        textView.layer.cornerRadius = 24
        textView.layer.shadowRadius = 4
        textView.clipsToBounds = false
        textView.layer.shadowOpacity = 0.4
        textView.layer.shadowOffset = CGSizeMake(2, 2)
        textView.layer.shadowColor = UIColor.link.cgColor
        
        saveButton.layer.cornerRadius = 22
        saveButton.clipsToBounds = false
        saveButton.layer.shadowOpacity = 0.4
        saveButton.layer.shadowOffset = CGSizeMake(1, 2)
        saveButton.layer.shadowColor = UIColor.link.cgColor
        
        setMlView.layer.cornerRadius = 20
        setMlView.clipsToBounds = false
        setMlView.layer.shadowOpacity = 0.4
        setMlView.layer.shadowOffset = CGSizeMake(1, 2)
        setMlView.layer.shadowColor = UIColor.link.cgColor
        
        selectButton.layer.cornerRadius = 22
        selectButton.clipsToBounds = false
        selectButton.layer.shadowOpacity = 0.4
        selectButton.layer.shadowOffset = CGSizeMake(1, 2)
        selectButton.layer.shadowColor = UIColor.link.cgColor
    }
}
