//
//  FirstSetupVM.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 20.09.2023.
//

import Foundation
import UIKit

final class FirstSetupVM {
    weak var delegate: FirstSetupVMDelegate?
    
    private var user = [User]()
}

extension FirstSetupVM: FirstSetupVMProtocol {
    func saveName(name: String) {
        if CoreDataManager.shared.saveProfile(name: name, gender: true, weight: "") == true {
            delegate?.handleVMOutput(.saveNameSuccess)
        } else {
            delegate?.handleVMOutput(.saveNameError)
        }
    }
    
}
