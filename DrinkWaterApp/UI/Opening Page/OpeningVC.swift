//
//  OpeningVC.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 11.09.2023.
//

import UIKit

class OpeningVC: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        let openingCell = UINib(nibName: "OpeningCell", bundle: nil)
        tableView.register(openingCell, forCellReuseIdentifier: "openingCell")
    }

}

extension OpeningVC {
    static func create() -> OpeningVC {
        let vc = OpeningVC(nibName: "OpeningVC", bundle: nil)
        return vc
    }
}

extension OpeningVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "openingCell") as! OpeningCell
        cell.configure()
        return cell
    }
}
