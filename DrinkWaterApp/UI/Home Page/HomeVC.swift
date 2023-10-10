//
//  HomeVC.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 11.09.2023.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var viewModel: HomeVMProtocol!
    private var water = [AddingWater]()
    private var dailyWater = [Daily]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getDailyWaterData()
        viewModel.getWaterData()
        
        let homeCell = UINib(nibName: "HomeCell", bundle: nil)
        tableView.register(homeCell, forCellReuseIdentifier: "homeCell")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView),
                                               name: NSNotification.Name(rawValue: "reloadHomeTableView"),
                                               object: nil)
    }
    
    @objc private func reloadTableView() {
        tableView.reloadData()
    }
    
    @objc func addButtonTapped() {
        navigationController?.pushViewController(AddingWaterVC.create(), animated: true)
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
        let dailyWaterData = dailyWater[indexPath.row]
        cell.delegate = self
        cell.selectionStyle = .none
        
        var waterSum = 0
        var index = 0
        while index < water.count {
            waterSum += water[index].water
            index += 1
        }
        cell.todayDrinkedWaterLabel.text = "\(waterSum)" + " Ml"
        
        cell.configure(dailyWaterData: dailyWaterData)
        return cell
    }
    
}

extension HomeVC: HomeVMDelegate {
    func handleVMOutput(_ output: HomeVMOutput) {
        switch output {
        case .getWaterDataSuccess(let water):
            self.water = water
            tableView.reloadData()
        case .getWaterDataError:
            showAlert(title: "Hata", message: "Veri Yüklenemedi")
        case .getDailyWaterDataSuccess(water: let dailyWater):
            self.dailyWater = dailyWater
        case.saveDataSuccess:
            tableView.reloadData()
        case .saveDataError:
            showAlert(title: "Hata", message: "Veri Kaydedilemedi")
        }
    }
}

extension HomeVC: HomeCellDelegate {
    func saveGlassButtonTapped(water: Int, Date: Date) {
        let alertController = UIAlertController(title: "Uyarı", message: "Veriyi Kaydetmek İstiyor Musunuz?", preferredStyle: UIAlertController.Style.actionSheet)
        let agreeButton = UIAlertAction(title: "Evet", style: .default) { action in
            self.viewModel.addWaterData(water: water, date: Date)
        }
        let cancelButton =  UIAlertAction(title: "Hayır", style: .destructive)
        alertController.addAction(agreeButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true)
    }
    
    func saveBlobButtonTapped(water: Int, Date: Date) {
        let alertController = UIAlertController(title: "Uyarı", message: "Veriyi Kaydetmek İstiyor Musunuz?", preferredStyle: UIAlertController.Style.actionSheet)
        let agreeButton = UIAlertAction(title: "Evet", style: .default) { action in
            self.viewModel.addWaterData(water: water, date: Date)
        }
        let cancelButton =  UIAlertAction(title: "Hayır", style: .destructive)
        alertController.addAction(agreeButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true)
    }
    
    func saveBigGlassButtonTapped(water: Int, Date: Date) {
        let alertController = UIAlertController(title: "Uyarı", message: "Veriyi Kaydetmek İstiyor Musunuz?", preferredStyle: UIAlertController.Style.actionSheet)
        let agreeButton = UIAlertAction(title: "Evet", style: .default) { action in
            self.viewModel.addWaterData(water: water, date: Date)
        }
        let cancelButton =  UIAlertAction(title: "Hayır", style: .destructive)
        alertController.addAction(agreeButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true)
    }
    
    func saveBottleWaterButtonTapped(water: Int, Date: Date) {
        let alertController = UIAlertController(title: "Uyarı", message: "Veriyi Kaydetmek İstiyor Musunuz?", preferredStyle: UIAlertController.Style.actionSheet)
        let agreeButton = UIAlertAction(title: "Evet", style: .default) { action in
            self.viewModel.addWaterData(water: water, date: Date)
        }
        let cancelButton =  UIAlertAction(title: "Hayır", style: .destructive)
        alertController.addAction(agreeButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true)
    }
    
    func saveError() {
        showAlert(title: "Hata", message: "Veri Kaydedilemedi")
    }
    
    func toNavigateAddWaterVC() {
        navigationController?.pushViewController(AddingWaterVC.create(), animated: true)
    }
    
}
