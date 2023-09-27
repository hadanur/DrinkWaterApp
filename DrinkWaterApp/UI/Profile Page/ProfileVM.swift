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
    private var water = [AddingWater]()
    private var dailyWater = [Daily]()
}

extension ProfileVM: ProfileVMProtocol {
    func getWaterData() {
        if let addWater = CoreDataManager.shared.getWaterData() {
            self.water = addWater
            delegate?.handleVMOutput(.fetchWaterDataSuccess(water: water))
        } else {
            delegate?.handleVMOutput(.fetchDataError)
        }
    }
    
    func getUserData() {
        if let profile = CoreDataManager.shared.getProfile() {
            self.user = profile
            delegate?.handleVMOutput(.fetchUserDataSuccess(profile: user))
        } else {
            delegate?.handleVMOutput(.fetchDataError)
        }
    }
    
    func getDailyWaterData() {
        if let daily = CoreDataManager.shared.getDailyWaterData() {
            self.dailyWater = daily
            delegate?.handleVMOutput(.fetchDailyWaterDataSuccess(daily: dailyWater))
        } else {
            delegate?.handleVMOutput(.fetchDataError)
        }
    }
    
    func resetDailyWaterData() {
        CoreDataManager.shared.dailyWaterReset()
        delegate?.handleVMOutput(.DailyWaterReset)
    }
}
