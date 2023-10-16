//
//  StatsVC.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 1.10.2023.
//

import UIKit

class StatsVC: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var viewModel: StatsVMProtocol!
    private var water = [AddingWater]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.getWaterData()
        viewModel.delegate = self
        
        let statsCell = UINib(nibName: "StatsCell", bundle: nil)
        tableView.register(statsCell, forCellReuseIdentifier: "statsCell")
    }
}

extension StatsVC {
    static func create() -> StatsVC {
        let vc = StatsVC(nibName: "StatsVC", bundle: nil)
        vc.viewModel = StatsVM()
        return vc
    }
}

extension StatsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        water.count > 0 ? water.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statsCell") as! StatsCell
        let data = water[indexPath.row]
        cell.configure(data: data)
        return cell
    }
}

extension StatsVC : StatsVMDelegate {
    func handleVMOutput(_ output: StatsVMOutput) {
        switch output {
        case .fetchWaterDataSuccess(water: let water):
            self.water = water
            tableView.reloadData()
        case .getWaterDataError:
            showAlert(title: "Hata", message: "Veri Yüklenemedi")
        }
    }
}
