//
//  UICollectionView + Extensions.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 12/01/23.
//

import UIKit

extension UICollectionView {

    func setupEmptyEmptyView(_ message: String) {
        
        // Remover se não for usar
        let emptyView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        
        emptyView.backgroundColor = UIColor(rgb: 0x0F1922)
        
        let emptyImage = UIImageView()
        emptyImage.translatesAutoresizingMaskIntoConstraints = false
        emptyImage.image = UIImage(systemName: "exclamationmark.triangle")
        emptyImage.tintColor = .white
        emptyView.addSubview(emptyImage)
        
        
        let emptyLabel = UILabel()
        emptyLabel.translatesAutoresizingMaskIntoConstraints = false
        emptyLabel.text = message
        emptyLabel.textColor = .white
        emptyLabel.numberOfLines = 0
        emptyLabel.textAlignment = .center
        emptyLabel.font = .systemFont(ofSize: 25)
        emptyLabel.sizeToFit()
        emptyView.addSubview(emptyLabel)

        self.backgroundView = EmptyAgentView()
        
        NSLayoutConstraint.activate([
            emptyImage.topAnchor.constraint(equalTo: emptyView.topAnchor, constant: 50),
            emptyImage.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor),
            emptyImage.heightAnchor.constraint(equalToConstant: emptyView.frame.height * 0.3),
            emptyImage.widthAnchor.constraint(equalTo: emptyImage.heightAnchor),
            
            emptyLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor),
            emptyLabel.topAnchor.constraint(equalTo: emptyImage.bottomAnchor, constant: 15)
        ])
    }

    func removeBackGroundView() {
        let emptyView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        emptyView.backgroundColor = UIColor(rgb: 0x0F1922)
        
        self.backgroundView = emptyView
    }
}

