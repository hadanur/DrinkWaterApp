//
//  HomeVM.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 11.09.2023.
//

import Foundation
import UIKit


class HomeVM {
    weak var delegate: HomeVMDelegate?
    
    private var water = [AddingWater]()
}

extension HomeVM: HomeVMProtocol {
    func getWaterData() {
        if let water = CoreDataManager.shared.getWaterData() {
            self.water = water
            delegate?.handleVMOutput(.getWaterDataSuccess(water: water))
        } else {
            delegate?.handleVMOutput(.getWaterDataError)
        }    }
    
    
}
