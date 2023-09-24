//
//  AddingWaterCell.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 22.09.2023.
//

import Foundation
import UIKit

protocol AddingWaterCellDelegate: AnyObject {
    func saveButtonTapped(water: String)
    func emptyInputsError()
}

class AddingWaterCell: UITableViewCell {
    @IBOutlet private weak var waterView: UIView!
    @IBOutlet private weak var saveButton: UIButton!
    @IBOutlet private weak var textView: UITextView!
    
    weak var delegate: AddingWaterCellDelegate?
    
    func configure () {
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
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let water = textView.text else { delegate?.emptyInputsError(); return }
        
        if textView.text != "" {
            delegate?.saveButtonTapped(water: water)
        } else {
            delegate?.emptyInputsError()
        }
    }
}
