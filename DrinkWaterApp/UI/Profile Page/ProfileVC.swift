//
//  ProfileVC.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 12.09.2023.
//

import UIKit

class ProfileVC: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        let profileCell = UINib(nibName: "ProfileCell", bundle: nil)
        tableView.register(profileCell, forCellReuseIdentifier: "profileCell")
    }


}

extension ProfileVC {
    static func create() -> ProfileVC {
        let vc = ProfileVC(nibName: "ProfileVC", bundle: nil)
        return vc
    }
}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell") as! ProfileCell
        return cell
    }
}
