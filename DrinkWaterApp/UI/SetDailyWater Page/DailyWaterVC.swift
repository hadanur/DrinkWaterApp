//
//  DailyWaterVC.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 24.09.2023.
//

import UIKit

class DailyWaterVC: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let dailyWaterCell = UINib(nibName: "DailyWaterCell", bundle: nil)
        tableView.register(dailyWaterCell, forCellReuseIdentifier: "dailyWaterCell")
    }

}

extension DailyWaterVC {
    static func create() -> DailyWaterVC {
        let vc = DailyWaterVC(nibName: "DailyWaterVC", bundle: nil)
        return vc
    }
}

extension DailyWaterVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dailyWaterCell") as! DailyWaterCell
        return cell
    }
}
