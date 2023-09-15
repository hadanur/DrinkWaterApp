//
//  LastSetupVC.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 15.09.2023.
//

import UIKit

class LastSetupVC: UIViewController {
    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.layer.cornerRadius = 24
        textView.layer.shadowRadius = 24
        textView.layer.shadowOpacity = 0.40
        textView.layer.shadowOffset = CGSizeMake(9, 9)
        textView.layer.shadowColor = UIColor.black.cgColor
        textView.layer.borderWidth = 0.4
        textView.layer.borderColor = UIColor.link.cgColor
        startButton.layer.cornerRadius = 30
        
    }
    
    @IBAction private func startButtonTapped(_ sender: Any) {
        
    }
    
}

extension LastSetupVC {
    static func create() -> LastSetupVC {
        let vc = LastSetupVC(nibName: "LastSetupVC", bundle: nil)
        return vc
    }
}
