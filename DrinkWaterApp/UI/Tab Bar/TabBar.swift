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
        tabBar.tintColor = UIColor.link
           setupVCs()
        self.tabBarController?.navigationItem.hidesBackButton = true
//        tabBar.backgroundColor = UIColor(red: 231.0/255.0, green: 240.0/255.0, blue: 255.0/255.0, alpha: 1)

    }
    
    func setupVCs() {
            viewControllers = [
                createNavController(for: HomeVC.create(), title: NSLocalizedString("", comment: ""), image: UIImage(named: "home")!),
                createNavController(for: StatsVC.create(), title: NSLocalizedString("", comment: ""), image: UIImage(named: "stats")!),
                createNavController(for: ProfileVC.create(), title: NSLocalizedString("", comment: ""), image: UIImage(named: "timeline")!),
                createNavController(for: SettingsVC.create(), title: NSLocalizedString("", comment: ""), image: UIImage(named: "settings")!)
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

