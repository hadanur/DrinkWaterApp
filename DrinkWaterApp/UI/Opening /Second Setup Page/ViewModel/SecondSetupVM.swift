//
//  SecondSetupVM.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 20.09.2023.
//

import Foundation
import UIKit

final class SecondSetupVM {
    weak var delegate: SecondSetupVMDelegate?
    
    private var user = [User]()
}

extension SecondSetupVM: SecondSetupVMProtocol {
    func saveGender(gender: Bool) {
        if CoreDataManager.shared.saveProfile(name: "", gender: gender, weight: "") == true {
            delegate?.handleVMOutput(.saveGenderSuccess)
        } else {
            delegate?.handleVMOutput(.saveGenderError)
        }
    }
    }
    
