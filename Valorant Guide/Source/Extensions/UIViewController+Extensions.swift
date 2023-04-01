//
//  UIViewController+Extensions.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 31/12/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showMessage(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }

    func startLoading() {
        let background = UIView()
        let container = UIView()
        let loading = UIActivityIndicatorView()

        background.translatesAutoresizingMaskIntoConstraints = false
        container.translatesAutoresizingMaskIntoConstraints = false
        loading.translatesAutoresizingMaskIntoConstraints = false
        
        background.tag = 1000
        background.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.8)
        
        container.backgroundColor = UIColor(rgb: 0x0F1922)
        container.clipsToBounds = true
        container.layer.cornerRadius = 10
        
        loading.color = .white
        loading.style = .large
        
        view.addSubview(background)
        background.addSubview(container)
        container.addSubview(loading)
        
        NSLayoutConstraint.activate([

            background.widthAnchor.constraint(equalTo: view.widthAnchor),
            background.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            container.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: background.centerYAnchor),
            container.widthAnchor.constraint(equalToConstant: 120),
            container.heightAnchor.constraint(equalToConstant: 120),
            
            loading.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            loading.centerYAnchor.constraint(equalTo: container.centerYAnchor)

        ])

        loading.startAnimating()
    }
    
    func stopLoading() {
        let seconds = 0.7
        let delay = seconds * Double(NSEC_PER_SEC)
        let dispatchTime = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
        
        DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: {
            if let viewWithTag = self.view.viewWithTag(1000) {
                viewWithTag.removeFromSuperview()
            }
        })
    }
}

