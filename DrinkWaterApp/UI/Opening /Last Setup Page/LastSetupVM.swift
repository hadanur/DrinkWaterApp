//
//  LastSetupVM.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 20.09.2023.
//

import Foundation
import UIKit

final class LastSetupVM {
    weak var delegate: LastSetupVMDelegate?
    
    private var user = [User]()
}

extension LastSetupVM: LastSetupVMProtocol {
    func saveWeight(weight: String) {
        if CoreDataManager.shared.saveWeight(weight: weight) == true {
            delegate?.handleVMOutput(.saveWeightSuccess)
        } else {
            delegate?.handleVMOutput(.saveWeightError)
        }
    }
    
    
}
