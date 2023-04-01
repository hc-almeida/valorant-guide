//
//  UIStackView+Extensions.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 07/01/23.
//

import Foundation
import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
