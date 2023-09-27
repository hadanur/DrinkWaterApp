//
//  HomeVC.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 11.09.2023.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var viewModel: HomeVMProtocol!
    private var water = [AddingWater]()
    private var dailyWater = [Daily]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getDailyWaterData()
        
        let homeCell = UINib(nibName: "HomeCell", bundle: nil)
        tableView.register(homeCell, forCellReuseIdentifier: "homeCell")
      
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView),
                                               name: NSNotification.Name(rawValue: "reloadHomeTableView"),
                                               object: nil)
    }
    
    @objc private func reloadTableView() {
        tableView.reloadData()
    }

    @objc func addButtonTapped() {
        navigationController?.pushViewController(AddingWaterVC.create(), animated: true)
    }
}

extension HomeVC {
    static func create() -> HomeVC {
        let vc = HomeVC(nibName: "HomeVC", bundle: nil)
        vc.viewModel = HomeVM()
        return vc
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as! HomeCell
        let dailyWaterData = dailyWater[indexPath.row]
        cell.selectionStyle = .none
        cell.configure(dailyWaterData: dailyWaterData)
        return cell
    }
    
}

extension HomeVC: HomeVMDelegate {
    func handleVMOutput(_ output: HomeVMOutput) {
        switch output {
        case .getWaterDataSuccess(let water):
            self.water = water
            tableView.reloadData()
        case .getWaterDataError:
            showAlert(title: "Hata", message: "Veri Yüklenemedi")
        case .getDailyWaterDataSuccess(water: let dailyWater):
            self.dailyWater = dailyWater
        }
    }
    
    
}
