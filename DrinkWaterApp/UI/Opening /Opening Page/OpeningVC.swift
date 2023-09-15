//
//  OpeningVC.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 15.09.2023.
//

import UIKit

class OpeningVC: UIViewController {
    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var openingImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 30
    }
    
    @IBAction private func startButtonTapped(_ sender: Any) {
        navigationController?.pushViewController(FirstSetupVC.create(), animated: true)
        navigationItem.backButtonDisplayMode = .minimal
    }
    
}

extension OpeningVC {
    static func create() -> OpeningVC {
        let vc = OpeningVC(nibName: "OpeningVC", bundle: nil)
        return vc
    }
}