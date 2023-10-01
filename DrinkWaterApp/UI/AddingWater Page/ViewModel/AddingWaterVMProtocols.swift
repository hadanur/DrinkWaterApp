//
//  AddingWaterVMProtocols.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 22.09.2023.
//

import Foundation
import UIKit

protocol AddingWaterVMProtocol {
    var delegate: AddingWaterVMDelegate? { get set }
    
    func addWaterData(water: Int, date: Date)
}

protocol AddingWaterVMDelegate: AnyObject {
    func handleVMOutput(_ output: AddingWaterVMOutput)
}

enum AddingWaterVMOutput {
    case saveDataSuccess
    case saveDataError
}
