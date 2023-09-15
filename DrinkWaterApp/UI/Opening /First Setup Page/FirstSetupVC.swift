//
//  SetupProfilePage.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 11.09.2023.
//

import UIKit

class FirstSetupVC: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var startButton: UIButton!
    
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

    @IBAction func startButtonTapped(_ sender: Any) {
        navigationController?.pushViewController(LastSetupVC.create(), animated: true)
    }
}

extension FirstSetupVC {
    static func create() -> FirstSetupVC {
        let vc = FirstSetupVC(nibName: "FirstSetupVC", bundle: nil)
        return vc
    }
}

