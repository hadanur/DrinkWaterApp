//
//  FirstSetupVMProtocols.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 20.09.2023.
//

import Foundation

protocol FirstSetupVMProtocol {
    var delegate: FirstSetupVMDelegate? { get set }
    
    func saveName(name: String)
}

protocol FirstSetupVMDelegate: AnyObject {
    func handleVMOutput(_ output: FirstSetupVMOutput)
}

enum FirstSetupVMOutput {
    case saveNameSuccess
    case saveNameError
}
