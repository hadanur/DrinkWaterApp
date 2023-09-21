//
//  SecondSetupVMProtocol.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 20.09.2023.
//

import Foundation

protocol SecondSetupVMProtocol {
    var delegate: SecondSetupVMDelegate? { get set }

    func saveGender(gender: Bool)

}

protocol SecondSetupVMDelegate: AnyObject {
    func handleVMOutput(_ output: SecondSetupVMOutput)

}

enum SecondSetupVMOutput {
    case saveGenderSuccess
    case saveGenderError
}
