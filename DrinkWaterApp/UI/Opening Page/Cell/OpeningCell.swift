//
//  OpeningCell.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 11.09.2023.
//

import Foundation
import UIKit

class OpeningCell: UITableViewCell {
    @IBOutlet private weak var openingView: UIView!
    @IBOutlet private weak var nameTextfield: UITextField!
    @IBOutlet private weak var heightTextfield: UITextField!
    @IBOutlet private weak var weightTextfield: UITextField!
    
    var heightPickerView = UIPickerView()
    var weightPickerView = UIPickerView()
    
    let height = [0,1,2,3]
    let weight = [6,7,8]
    
    func configure() {
        
        heightTextfield.inputView = heightPickerView
        heightTextfield.textAlignment = .center
        
        weightTextfield.inputView = weightPickerView
        weightTextfield.textAlignment = .center
        
        heightPickerView.delegate = self
        heightPickerView.dataSource = self
        
        weightPickerView.delegate = self
        weightPickerView.dataSource = self
    }
    
}

extension OpeningCell: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if heightTextfield.isSelected == true {
          return height.count
        } else {
           return weight.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(height[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        heightTextfield.text = "\(height[row])"
        heightTextfield.resignFirstResponder()
    }
    
    
}
