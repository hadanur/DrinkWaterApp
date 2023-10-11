//
//  SettingsContentVC.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 11.10.2023.
//

import UIKit

enum SettingsContent {
    case notificationStyle

    func tableViewData() -> [String] {
        switch self {
        case.notificationStyle:
            return ["Açık", "Kapalı"]
        }
    }
}

class SettingsContentVC: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var viewModel: SettingsContentVM!
    private var vcTitle: String!
    private var contentType: SettingsContent!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        title = title

    }

}

extension SettingsContentVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contentType.tableViewData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = contentType.tableViewData()[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Poppins-Regular", size: 16)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        switch contentType {
        case .notificationStyle:
            if indexPath.row == 0 {
                viewModel.selectNotificationStyle(option: .on)
            } else {
                viewModel.selectNotificationStyle(option: .off)
            }
        case .none:
            break
        }
        cell.isSelected = false
    }
}

extension SettingsContentVC {
    static func create(vcTitle: String, content: SettingsContent) -> SettingsContentVC {
        let vc = SettingsContentVC(nibName: "SettingsContentVC", bundle: nil)
        vc.viewModel = SettingsContentVM()
        vc.title = vcTitle
        vc.contentType = content
        return vc
    }
}

extension SettingsContentVC: SettingsContentVMDelegate {
    func selectNotificationStyle() {
        navigationController?.popViewController(animated: true)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadSettingsTableView"), object: nil)
    }
    
    
}
