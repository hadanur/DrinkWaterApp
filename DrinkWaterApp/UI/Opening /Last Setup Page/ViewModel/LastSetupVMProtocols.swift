//
//  LastSetupVMProtocol.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 20.09.2023.
//

import Foundation

protocol LastSetupVMProtocol {
    var delegate: LastSetupVMDelegate? { get set }
    
    func saveWeight(weight: String)
}

protocol LastSetupVMDelegate: AnyObject {
    func handleVMOutput(_ output: LastSetupVMOutput)
}

enum LastSetupVMOutput {
    case saveWeightSuccess
    case saveWeightError
}

