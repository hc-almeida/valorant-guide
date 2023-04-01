//
//  MainTabBarController.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 26/02/23.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let agentsVC = AgentsListFactory.setup()
        let favoritesVC = FavoritesFactory.setup()
        agentsVC.title = "Agents"
        favoritesVC.title = "Favorites"
        
        let homeNC = MainNavigationController(rootViewController: agentsVC)
        let favoritesNC = MainNavigationController(rootViewController: favoritesVC)
        
        self.setViewControllers([homeNC, favoritesNC], animated: true)
        
        guard let items = self.tabBar.items else { return }
        let images = [UIImage(systemName: "house.fill"), UIImage(systemName: "star.fill")]
        
        for (item, image) in zip(items, images) {
            item.image = image
        }
        
        self.tabBar.tintColor = .white
        self.tabBar.barTintColor = UIColor(rgb: 0x0F1922)
        self.tabBar.unselectedItemTintColor = .lightGray
    }
}

