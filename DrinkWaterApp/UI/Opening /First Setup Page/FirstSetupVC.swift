//
//  SetupProfilePage.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 11.09.2023.
//

import UIKit

class FirstSetupVC: UIViewController {
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var startButton: UIButton!
    
    private var viewModel: FirstSetupVMProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.layer.cornerRadius = 24
        textView.layer.shadowRadius = 4
        textView.clipsToBounds = false
        textView.layer.shadowOpacity = 0.4
        textView.layer.shadowOffset = CGSizeMake(2, 2)
        textView.layer.shadowColor = UIColor.link.cgColor
        startButton.layer.cornerRadius = 22
        viewModel.delegate = self
    }

    @IBAction private func startButtonTapped(_ sender: Any) {
        viewModel.saveName(name: textView.text)
    }
}

extension FirstSetupVC {
    static func create() -> FirstSetupVC {
        let vc = FirstSetupVC(nibName: "FirstSetupVC", bundle: nil)
        vc.viewModel = FirstSetupVM()
        return vc
    }
}

extension FirstSetupVC: FirstSetupVMDelegate {
    func handleVMOutput(_ output: FirstSetupVMOutput) {
        switch output {
        case .saveNameSuccess:
            navigationController?.pushViewController(SecondSetupVC.create(), animated: true)
            navigationItem.backButtonDisplayMode = .minimal
        case .saveNameError:
            showAlert(title: "Hata", message: "İsim Kaydedilemedi")
        }
    }
}

