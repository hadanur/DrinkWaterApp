//
//  HomeVMProtocols.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 21.09.2023.
//

import Foundation
import UIKit

protocol HomeVMProtocol {
    var delegate: HomeVMDelegate? { get set }

    func getWaterData()
    func getDailyWaterData()
    func addWaterData(water: Int, date: Date)
}

protocol HomeVMDelegate: AnyObject {
    func handleVMOutput(_ output: HomeVMOutput)
}

enum HomeVMOutput {
    case getWaterDataSuccess(water: [AddingWater])
    case getDailyWaterDataSuccess(water: [Daily])
    case getWaterDataError
    case saveDataSuccess
    case saveDataError
}
