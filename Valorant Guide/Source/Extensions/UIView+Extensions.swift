//
//  UIView+Extensions.swift
//  ValorantGuide
//
//  Created by Hellen Caroline  on 13/12/22.
//

import Foundation
import UIKit

extension UIView {
    func setBackground(colorFirst: UIColor, colorLast: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [colorFirst.cgColor, colorLast.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        self.layer.addSublayer(gradient)
    }
}
