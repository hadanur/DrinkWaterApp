//
//  StatsVM.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 1.10.2023.
//

import Foundation

class StatsVM {
    weak var delegate: StatsVMDelegate?
    
    private var water = [AddingWater]()

}

extension StatsVM: StatsVMProtocol {
    func getWaterData() {
        if let addWater = CoreDataManager.shared.getWaterData() {
            self.water = addWater
            delegate?.handleVMOutput(.fetchWaterDataSuccess(water: water))
        } else {
            delegate?.handleVMOutput(.getWaterDataError)
        }
    }
    
    
}
