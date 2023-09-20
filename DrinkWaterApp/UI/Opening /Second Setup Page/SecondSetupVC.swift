//
//  SecondSetupVC.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 15.09.2023.
//

import UIKit

class SecondSetupVC: UIViewController {
    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var maleView: UIView!
    @IBOutlet private weak var femaleView: UIView!
    
    var gender: Bool!
    
    private var viewModel: SecondSetupVMProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startButton.layer.cornerRadius = 22
        startButton.isHidden = true
        
        maleView.layer.cornerRadius = 20
        maleView.clipsToBounds = false
        maleView.layer.shadowOpacity = 0.4
        maleView.layer.shadowOffset = CGSizeMake(1, 2)
        maleView.layer.shadowColor = UIColor.link.cgColor
        self.view.addSubview(maleView)
        let maleGesture = UITapGestureRecognizer(target: self, action: #selector(didMaleViewTapped))
        self.maleView.addGestureRecognizer(maleGesture)
        
        femaleView.layer.cornerRadius = 20
        femaleView.clipsToBounds = false
        femaleView.layer.shadowOpacity = 0.4
        femaleView.layer.shadowOffset = CGSizeMake(1, 2)
        femaleView.layer.shadowColor = UIColor.link.cgColor
        self.view.addSubview(femaleView)
        let femaleGesture = UITapGestureRecognizer(target: self, action: #selector(didFemaleViewTapped))
        self.femaleView.addGestureRecognizer(femaleGesture)
    }

    @IBAction private func startButtonTapped(_ sender: Any) {
        navigationController?.pushViewController(LastSetupVC.create(), animated: true)
        navigationItem.backButtonDisplayMode = .minimal

    }
    
    @objc func didMaleViewTapped(_ sender: UITapGestureRecognizer) {
        maleView.backgroundColor = UIColor(red: 85.0 / 255.0, green: 141.0 / 255.0, blue: 227.0 / 255.0, alpha: 0.25)
        femaleView.backgroundColor = .systemBackground
        startButton.isHidden = false
        gender = true
    }
    
    @objc func didFemaleViewTapped(_ sender: UITapGestureRecognizer) {
        femaleView.backgroundColor = UIColor(red: 85.0 / 255.0, green: 141.0 / 255.0, blue: 227.0 / 255.0, alpha: 0.25)
        maleView.backgroundColor = .systemBackground
        startButton.isHidden = false
        gender = false
    }
    
}

extension SecondSetupVC {
    static func create() -> SecondSetupVC {
        let vc = SecondSetupVC(nibName: "SecondSetupVC", bundle: nil)
        vc.viewModel = SecondSetupVM()
        return vc
    }
}

extension SecondSetupVC: SecondSetupVMDelegate {
    func handleVMOutput(_ output: SecondSetupVMOutput) {
        switch output {
        case .saveGenderSuccess:
            navigationController?.pushViewController(LastSetupVC.create(), animated: true)
            navigationItem.backButtonDisplayMode = .minimal
        case .saveGenderError:
            showAlert(title: "Hata", message: "Cinsiyet Kaydedilemedi")
        }
    }
    
    
}
