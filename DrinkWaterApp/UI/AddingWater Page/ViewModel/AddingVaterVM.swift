//
//  AddingVaterVM.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 22.09.2023.
//

import Foundation
import UIKit

class AddingWaterVM {
    weak var delegate: AddingWaterVMDelegate?
    
    private var water = [AddWater]()
}

extension AddingWaterVM: AddingWaterVMProtocol {
    func addWaterData(water: String) {
        if CoreDataManager.shared.addingWaterData(water: water) == true {
            delegate?.handleVMOutput(.saveDataSuccess)
        } else {
            delegate?.handleVMOutput(.saveDataError)
        }
    }
    
}
