//
//  StatsVMProtocols.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 1.10.2023.
//

import Foundation

protocol StatsVMProtocol {
    var delegate: StatsVMDelegate? { get set }
    
    func getWaterData()

}

protocol StatsVMDelegate: AnyObject {
    func handleVMOutput(_ output: StatsVMOutput)
}

enum StatsVMOutput {
    case getWaterDataSuccess(water: [AddingWater])
    case getWaterDataError
}

