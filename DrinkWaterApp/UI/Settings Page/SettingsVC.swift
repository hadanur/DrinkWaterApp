//
//  SettingsVC.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 12.09.2023.
//

import UIKit

class SettingsVC: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private var viewModel: SettingsVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let settingsCell = UINib(nibName: "SettingsCell", bundle: nil)
        tableView.register(settingsCell, forCellReuseIdentifier: "settingsCell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView),
                                               name: NSNotification.Name(rawValue: "reloadSettingsTableView"),
                                               object: nil)
    }

    @objc private func reloadTableView() {
        tableView.reloadData()
    }
}

extension SettingsVC {
    static func create() -> SettingsVC {
        let vc = SettingsVC(nibName: "SettingsVC", bundle: nil)
        vc.viewModel = SettingsVM()
        return vc
    }
}

extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell") as! SettingsCell
        let data = viewModel.data[indexPath.row]
        let selectedNotificationOption = SettingsManager.shared.getSelectedNotificationName()
        let selectedNotificationSoundOption = SettingsManager.shared.getSelectedNotificationSoundName()
        
        if indexPath.row == 0 {
            cell.configure(title: data, selection: ">")
        } else if indexPath.row == 1 {
            cell.configure(title: data, selection: selectedNotificationOption)
        } else if indexPath.row == 2 {
            cell.configure(title: data, selection: selectedNotificationSoundOption)
        } else if indexPath.row == 3 {
            cell.configure(title: data, selection: ">")
        } else if indexPath.row == 4 {
            cell.configure(title: data, selection: ">")
        } else {
            cell.configure(title: data, selection: "v1.0")

        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.isSelected = false
        
        let data = viewModel.data[indexPath.row]
        var settingsContent: SettingsContent
        
        if indexPath.row == 0 {
            navigationController?.pushViewController(DailyWaterVC.create(), animated: true)
            navigationController?.navigationItem.setHidesBackButton(true, animated: true)
        } else if indexPath.row == 1 {
            settingsContent = .notificationStyle
            let settingsContentVC = SettingsContentVC.create(vcTitle: data, content: settingsContent)
            navigationController?.pushViewController(settingsContentVC, animated: true)
        } else if indexPath.row == 2 {
            settingsContent = .notificationSoundStyle
            let settingsContentVC = SettingsContentVC.create(vcTitle: data, content: settingsContent)
            navigationController?.pushViewController(settingsContentVC, animated: true)
        } else if indexPath.row == 3 {
            
        }
    }
}
