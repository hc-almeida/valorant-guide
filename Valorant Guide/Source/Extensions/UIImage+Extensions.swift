//
//  UIImage+Extensions.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 29/01/23.
//

import UIKit

extension UIImage {
    enum SystemImage: String {
    case starFill = "star.fill"
    case trashFill = "trash.fill"
    case sliderHorizontal3 = "slider.horizontal.3"
    case xmark = "xmark"
    }
    
    static func makeWith(systemImage: SystemImage,
                         color: UIColor? = nil) -> UIImage? {
        var image = UIImage(systemName: systemImage.rawValue)

        if let color = color {
            image = image?.withTintColor(color, renderingMode: .alwaysOriginal)
        }
        
        return image
    }

    static func makeWith(name: String,
                         color: UIColor? = nil) -> UIImage? {
        var image = UIImage(named: name)

        if let color = color {
            image = image?.withTintColor(color, renderingMode: .alwaysOriginal)
        }
        
        return image
    }
}
