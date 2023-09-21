//
//  TabBar.swift
//  DrinkWaterApp
//
//  Created by Hakan Adanur on 21.09.2023.
//

import Foundation
import UIKit

class TabBar: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
           tabBar.tintColor = UIColor(red: 245.0 / 255.0, green: 185.0 / 255.0, blue: 101.0 / 255.0, alpha: 2)
           setupVCs()
        self.tabBarController?.navigationItem.hidesBackButton = true

    }
    
    func setupVCs() {
            viewControllers = [
                createNavController(for: HomeVC.create(), title: NSLocalizedString("", comment: ""), image: UIImage(systemName: "pencil")!),
                createNavController(for: ProfileVC.create(), title: NSLocalizedString("", comment: ""), image: UIImage(systemName: "pencil")!),
                createNavController(for: SettingsVC.create(), title: NSLocalizedString("", comment: ""), image: UIImage(systemName: "pencil")!)
            ]
        }
    
    private func createNavController(for rootViewController: UIViewController,
                                                      title: String,
                                                      image: UIImage) -> UIViewController {
            let navController = UINavigationController(rootViewController: rootViewController)
            navController.tabBarItem.title = title
            navController.tabBarItem.image = image
            rootViewController.navigationItem.title = title
            return navController
        }
}

