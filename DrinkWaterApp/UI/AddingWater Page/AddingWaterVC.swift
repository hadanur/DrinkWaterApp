//
//  AddingWaterVC.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 22.09.2023.
//

import UIKit

class AddingWaterVC: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var viewModel: AddingWaterVMProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self

        let addingWaterCell = UINib(nibName: "AddingWaterCell", bundle: nil)
        tableView.register(addingWaterCell, forCellReuseIdentifier: "addingWaterCell")
    }

}

extension AddingWaterVC {
    static func create() -> AddingWaterVC {
        let vc = AddingWaterVC(nibName: "AddingWaterVC", bundle: nil)
        vc.viewModel = AddingWaterVM()
        return vc
    }
}

extension AddingWaterVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addingWaterCell") as! AddingWaterCell
        cell.configure()
        return cell
    }
}

extension AddingWaterVC: AddingWaterVMDelegate {
    func handleVMOutput(_ output: AddingWaterVMOutput) {
        switch output {
        case .saveDataSuccess:
            navigationController?.pushViewController(HomeVC.create(), animated: true)
            tableView.reloadData()
        case .saveDataError:
            showAlert(title: "Hata", message: "Veri Kaydedilemedi")
        }
    }
    
    
}
