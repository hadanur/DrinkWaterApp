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
    func changeMlButtonTapped()
    func continueButtonTapped()
}

class DailyWaterCell: UITableViewCell {
    @IBOutlet private weak var dailyWaterView: UIView!
    @IBOutlet private weak var saveButton: UIButton!
    @IBOutlet private weak var mlLabel: UILabel!
    @IBOutlet private weak var popUpView: UIView!
    @IBOutlet private weak var changeMlButton: UIButton!
    @IBOutlet private weak var popUpChangeButton: UIButton!
    @IBOutlet private weak var popUpContinueButton: UIButton!
    @IBOutlet private weak var popUpTextView: UITextView!
    
    weak var delegate: DailyWaterCellDelegate?
    
    func configure() {
        commonInit()
    }
    
    @IBAction private func saveButtonTapped(_ sender: Any) {
        guard let ml = mlLabel.text else { delegate?.emptyInputsError(); return }
            delegate?.saveButtonTapped(ml: ml)
        
    }
    
    @IBAction private func changeMlButtonTapped(_ sender: Any) {
        popUpView.isHidden = false
        dailyWaterView.backgroundColor = .opaqueSeparator
        delegate?.changeMlButtonTapped()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "setPopUpNavBar"), object: nil)
    }

    @IBAction private func popUpContinueButtonTapped(_ sender: Any) {
        mlLabel.text = popUpTextView.text + " ml"
        dailyWaterView.backgroundColor = .systemBackground
        popUpView.isHidden = true
        delegate?.continueButtonTapped()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "resetPopUpNavBar"), object: nil)
    }
    
    @IBAction private func popUpChangeButtonTapped(_ sender: Any) {
        dailyWaterView.backgroundColor = .systemBackground
        delegate?.continueButtonTapped()
        popUpView.isHidden = true
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "resetPopUpNavBar"), object: nil)
    }
    
    private func commonInit() {
        popUpTextView.layer.cornerRadius = 24
        popUpTextView.layer.shadowRadius = 4
        popUpTextView.clipsToBounds = false
        popUpTextView.layer.shadowOpacity = 0.4
        popUpTextView.layer.shadowOffset = CGSizeMake(2, 2)
        popUpTextView.layer.shadowColor = UIColor.link.cgColor
        
        saveButton.layer.cornerRadius = 22
        saveButton.clipsToBounds = false
        saveButton.layer.shadowOpacity = 0.4
        saveButton.layer.shadowOffset = CGSizeMake(1, 2)
        saveButton.layer.shadowColor = UIColor.link.cgColor
        
        changeMlButton.layer.cornerRadius = 22
        changeMlButton.clipsToBounds = false
        changeMlButton.layer.shadowOpacity = 0.4
        changeMlButton.layer.shadowOffset = CGSizeMake(1, 2)
        changeMlButton.layer.shadowColor = UIColor.link.cgColor
        
        popUpChangeButton.layer.cornerRadius = 22
        popUpChangeButton.clipsToBounds = false
        popUpChangeButton.layer.shadowOpacity = 0.4
        popUpChangeButton.layer.shadowOffset = CGSizeMake(1, 2)
        popUpChangeButton.layer.shadowColor = UIColor.link.cgColor
        
        popUpContinueButton.layer.cornerRadius = 22
        popUpContinueButton.clipsToBounds = false
        popUpContinueButton.layer.shadowOpacity = 0.4
        popUpContinueButton.layer.shadowOffset = CGSizeMake(1, 2)
        popUpContinueButton.layer.shadowColor = UIColor.link.cgColor
        
        popUpView.layer.cornerRadius = 22
        popUpView.clipsToBounds = false
        popUpView.layer.shadowOpacity = 0.4
        popUpView.layer.shadowOffset = CGSizeMake(1, 2)
        popUpView.layer.shadowColor = UIColor.link.cgColor
        
        popUpTextView.layer.cornerRadius = 24
        popUpTextView.layer.shadowRadius = 4
        popUpTextView.clipsToBounds = false
        popUpTextView.layer.shadowOpacity = 0.4
        popUpTextView.layer.shadowOffset = CGSizeMake(2, 2)
        popUpTextView.layer.shadowColor = UIColor.link.cgColor
        
        popUpView.isHidden = true
    }
}
