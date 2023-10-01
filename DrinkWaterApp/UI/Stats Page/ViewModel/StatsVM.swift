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
        func getWaterData() {
            if let water = CoreDataManager.shared.getWaterData() {
                self.water = water
                delegate?.handleVMOutput(.getWaterDataSuccess(water: water))
            } else {
                delegate?.handleVMOutput(.getWaterDataError)
            }
        }
    }
    
    
}
