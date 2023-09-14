//
//  SettingsVC.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 12.09.2023.
//

import UIKit

class SettingsVC: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let settingsCell = UINib(nibName: "SettingsCell", bundle: nil)
        tableView.register(settingsCell, forCellReuseIdentifier: "settingsCell")
    }


}

extension SettingsVC {
    static func create() -> SettingsVC {
        let vc = SettingsVC(nibName: "SettingsVC", bundle: nil)
        return vc
    }
}

extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell") as! SettingsCell
        return cell
    }
}
