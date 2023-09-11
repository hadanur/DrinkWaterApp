//
//  SetupProfilePage.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 11.09.2023.
//

import UIKit

class SetupProfilePageVC: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let setupProfileCell = UINib(nibName: "SetupProfileCell", bundle: nil)
        tableView.register(setupProfileCell, forCellReuseIdentifier: "setupProfileCell")
    }

}

extension SetupProfilePageVC {
    static func create() -> SetupProfilePageVC {
        let vc = SetupProfilePageVC(nibName: "SetupProfilePageVC", bundle: nil)
        return vc
    }
}

extension SetupProfilePageVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "setupProfileCell") as! SetupProfileCell
        return cell
    }
}
