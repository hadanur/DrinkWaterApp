//
//  HomeVC.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 11.09.2023.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var viewModel: HomeVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeCell = UINib(nibName: "HomeCell", bundle: nil)
        tableView.register(homeCell, forCellReuseIdentifier: "homeCell")
        
        tableView.delegate = self
        tableView.dataSource = self
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
        return cell
    }
    
    
}
