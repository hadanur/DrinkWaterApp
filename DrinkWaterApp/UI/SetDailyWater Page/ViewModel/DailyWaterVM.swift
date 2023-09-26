//
//  DailyWaterVM.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 24.09.2023.
//

import Foundation
import UIKit

class DailyVaterVM {
    weak var delegate: DailyWaterVMDelegate?
    
}

extension DailyVaterVM: DailyWaterVMProtocol {
    func addDailyWaterMl(ml: String) {
        if CoreDataManager.shared.DailyWaterCalculate(ml: ml) == true {
            delegate?.handleVMOutput(.saveDailyWaterMlSuccess)
        } else {
            delegate?.handleVMOutput(.SaveDailyWaterMlError)
        }
    }
}
