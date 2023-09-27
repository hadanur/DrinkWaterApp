//
//  ProfileVC.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 12.09.2023.
//

import UIKit

class ProfileVC: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var viewModel: ProfileVMProtocol!
    private var profile = [User]()
    private var water = [AddingWater]()
    private var dailyWater = [Daily]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self
        viewModel.getUserData()
        viewModel.getWaterData()
        viewModel.getDailyWaterData()
        
        let profileCell = UINib(nibName: "ProfileCell", bundle: nil)
        tableView.register(profileCell, forCellReuseIdentifier: "profileCell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView),
                                               name: NSNotification.Name(rawValue: "reloadProfileTableView"),
                                               object: nil)
    }
    
    @objc private func reloadTableView() {
        tableView.reloadData()
    }
}

extension ProfileVC {
    static func create() -> ProfileVC {
        let vc = ProfileVC(nibName: "ProfileVC", bundle: nil)
        vc.viewModel = ProfileVM()
        return vc
    }
}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell") as! ProfileCell
        let userData = profile[indexPath.row]
        let dailyWaterData = dailyWater[indexPath.row]
        cell.configure(userData: userData, dailyWaterData: dailyWaterData)
        
        var waterSum = 0
        var index = 0
        while index < water.count {
            waterSum += water[index].water
            index += 1
        }
        cell.drinkedWaterLabel.text = "\(waterSum)" + " Ml"
        return cell
    }
}

extension ProfileVC: ProfileVMDelegate {
    func handleVMOutput(_ output: ProfileVMOutput) {
        switch output {
        case .fetchUserDataSuccess(let profile):
            self.profile = profile
            tableView.reloadData()
        case .fetchDataError:
            showAlert(title: "Hata", message: "Profil Yüklenemedi")
        case .fetchWaterDataSuccess(water: let water):
            self.water = water
            tableView.reloadData()
        case .fetchDailyWaterDataSuccess(daily: let daily):
            self.dailyWater = daily
            tableView.reloadData()
        case .DailyWaterReset:
            viewModel.resetDailyWaterData()
            tableView.reloadData()
            navigationController?.pushViewController(DailyWaterVC.create(), animated: true)
            navigationController?.navigationBar.isHidden = true
        }
    }
    
}
