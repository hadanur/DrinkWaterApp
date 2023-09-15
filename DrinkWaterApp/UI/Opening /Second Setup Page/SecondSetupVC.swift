//
//  SecondSetupVC.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 15.09.2023.
//

import UIKit

class SecondSetupVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension SecondSetupVC {
    static func create() -> SecondSetupVC {
        let vc = SecondSetupVC(nibName: "SecondSetupVC", bundle: nil)
        return vc
    }
}
