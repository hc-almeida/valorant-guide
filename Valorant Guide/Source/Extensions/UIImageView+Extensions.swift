//
//  UIImageView+Extensions.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 31/12/22.
//

import Foundation
import UIKit

extension UIImageView {
    func addImageFromURL(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if error == nil {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data!)
                }
            }
        }.resume()
    }
}
