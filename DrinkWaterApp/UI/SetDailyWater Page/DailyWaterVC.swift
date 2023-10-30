//
//  DailyWaterVC.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 24.09.2023.
//

import UIKit

class DailyWaterVC: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private var viewModel: DailyWaterVMProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        
        let dailyWaterCell = UINib(nibName: "DailyWaterCell", bundle: nil)
        tableView.register(dailyWaterCell, forCellReuseIdentifier: "dailyWaterCell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(setPopUpNavBar),
                                               name: NSNotification.Name(rawValue: "setPopUpNavBar"),
                                               object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(resetPopUpNavBar),
                                               name: NSNotification.Name(rawValue: "resetPopUpNavBar"),
                                               object: nil)
    }
    
    @objc private func setPopUpNavBar() {
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = UIColor.opaqueSeparator
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
    }
    
    @objc private func resetPopUpNavBar() {
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = UIColor.systemBackground
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
    }

}

extension DailyWaterVC {
    static func create() -> DailyWaterVC {
        let vc = DailyWaterVC(nibName: "DailyWaterVC", bundle: nil)
        vc.viewModel = DailyVaterVM()
        return vc
    }
}

extension DailyWaterVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dailyWaterCell") as! DailyWaterCell
        cell.configure()
        cell.delegate = self
        return cell
    }
}

extension DailyWaterVC: DailyWaterVMDelegate {
    func handleVMOutput(_ output: DailyWaterVMOutput) {
        switch output {
        case .saveDailyWaterMlSuccess:
            tableView.reloadData()
            navigationController?.pushViewController(TabBar(), animated: true)
            navigationController?.navigationItem.setHidesBackButton(true, animated: true)
            UserDefaults.standard.set("opened", forKey: "isFirstOpen")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadProfileTableView"), object: nil)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadHomeTableView"), object: nil)
            navigationController?.navigationBar.isHidden = true
        case .SaveDailyWaterMlError:
            showAlert(title: "Hata", message: "Veri Kaydedilemedi")
        }
    }
}

extension DailyWaterVC: DailyWaterCellDelegate {
    func changeMlButtonTapped() {
        navigationController?.navigationBar.backgroundColor = .opaqueSeparator
    }
    
    func continueButtonTapped() {
        navigationController?.navigationBar.backgroundColor = .systemBackground
    }
    
    func saveButtonTapped(ml: String) {
        viewModel.addDailyWaterMl(ml: ml)
    }
    
    func emptyInputsError() {
        showAlert(title: "Hata", message: "Veri Kaydedilemedi")
    }
    
}
