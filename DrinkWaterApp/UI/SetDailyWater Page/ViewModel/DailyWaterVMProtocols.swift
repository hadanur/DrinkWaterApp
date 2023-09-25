//
//  DailyWaterVMProtocols.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 24.09.2023.
//

import Foundation
import UIKit

protocol DailyWaterVMProtocol {
    var delegate: DailyWaterVMDelegate? { get set }
    
    func addDailyWaterMl(ml: String)
}

protocol DailyWaterVMDelegate: AnyObject {
    func handleVMOutput(_ output: DailyWaterVMOutput)
}

enum DailyWaterVMOutput {
    case saveDailyWaterMlSuccess
    case SaveDailyWaterMlError
}
