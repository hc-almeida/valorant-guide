//
//  FavoriteButton.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 29/01/23.
//

import UIKit

class FavoriteButton: UIButton {
    
    var agentId = ""
    var isFavorite = false {
        didSet {
            let color: UIColor = isFavorite ? .init(rgb: 0xFFC13B) : .white
            setImage(.makeWith(systemImage: .starFill, color: color), for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImage(.makeWith(systemImage: .starFill, color: .white), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func toggleState() {
        isFavorite = !isFavorite
    }
}
