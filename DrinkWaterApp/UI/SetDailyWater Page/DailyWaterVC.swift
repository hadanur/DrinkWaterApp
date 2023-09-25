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
            navigationController?.navigationBar.isHidden = true
        case .SaveDailyWaterMlError:
            showAlert(title: "Hata", message: "Veri Kaydedilemedi")
        }
    }
}

extension DailyWaterVC: DailyWaterCellDelegate {
    func saveButtonTapped(ml: String) {
        viewModel.addDailyWaterMl(ml: ml)
    }
    
    func emptyInputsError() {
        showAlert(title: "Hata", message: "Veri Kaydedilemedi")
    }
    
}