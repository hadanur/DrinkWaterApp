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
}

protocol ProfileVMDelegate: AnyObject {
    func handleVMOutput(_ output: ProfileVMOutput)
}

enum ProfileVMOutput {
    case fetchUserDataSuccess(profile: [User])
    case fetchDataError
    case fetchWaterDataSuccess(water: [AddingWater])
}
