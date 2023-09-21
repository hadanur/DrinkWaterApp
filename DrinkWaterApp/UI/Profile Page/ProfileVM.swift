//
//  ProfileVM.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 21.09.2023.
//

import Foundation
import UIKit

final class ProfileVM {
    weak var delegate: ProfileVMDelegate?
    
    private var user = [User]()
}

extension ProfileVM: ProfileVMProtocol {
    func getUserData() {
        if let profile = CoreDataManager.shared.getProfile() {
            self.user = profile
            delegate?.handleVMOutput(.fetchDataSuccess(profile: user))
        } else {
            delegate?.handleVMOutput(.fetchDataError)
        }
    }
    
    
}
