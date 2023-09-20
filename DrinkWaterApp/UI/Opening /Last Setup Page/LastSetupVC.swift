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
    
    private var viewModel: LastSetupVMProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        commonInit()
    }
    
    private func commonInit() {
        textView.layer.cornerRadius = 24
        textView.layer.shadowRadius = 4
        textView.clipsToBounds = false
        textView.layer.shadowOpacity = 0.4
        textView.layer.shadowOffset = CGSizeMake(2, 2)
        textView.layer.shadowColor = UIColor.link.cgColor
        startButton.layer.cornerRadius = 22
    }
    
    @IBAction private func startButtonTapped(_ sender: Any) {
        viewModel.saveWeight(weight: textView.text)
    }
    
}

extension LastSetupVC {
    static func create() -> LastSetupVC {
        let vc = LastSetupVC(nibName: "LastSetupVC", bundle: nil)
        vc.viewModel = LastSetupVM()
        return vc
    }
}

extension LastSetupVC: LastSetupVMDelegate {
    func handleVMOutput(_ output: LastSetupVMOutput) {
        switch output {
        case .saveWeightSuccess:
            navigationController?.pushViewController(HomeVC.create(), animated: true)
            navigationItem.backButtonDisplayMode = .minimal
        case .saveWeightError:
            showAlert(title: "Hata", message: "Kilo Kaydedilemedi")
        }
    }
    
    
}
