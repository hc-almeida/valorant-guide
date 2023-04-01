//
//  MainNavigationController.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 26/02/23.
//

import Foundation
import UIKit

class MainNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(rgb: 0x0F1922)

        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationBar.tintColor = .white
        navigationBar.standardAppearance = appearance
    }
}
