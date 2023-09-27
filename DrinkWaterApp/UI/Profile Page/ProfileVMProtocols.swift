//
//  ProfileVMProtocols.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 21.09.2023.
//

import Foundation

protocol ProfileVMProtocol {
    var delegate: ProfileVMDelegate? { get set }
    
    func getUserData()
    func getWaterData()
    func getDailyWaterData()
    func resetDailyWaterData()
}

protocol ProfileVMDelegate: AnyObject {
    func handleVMOutput(_ output: ProfileVMOutput)
}

enum ProfileVMOutput {
    case fetchUserDataSuccess(profile: [User])
    case fetchWaterDataSuccess(water: [AddingWater])
    case fetchDailyWaterDataSuccess(daily: [Daily])
    case fetchDataError
    case DailyWaterReset
}
