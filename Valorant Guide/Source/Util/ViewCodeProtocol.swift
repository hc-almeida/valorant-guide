//
//  ViewCodeProtocol.swift
//  ValorantGuide
//
//  Created by Hellen Caroline  on 13/12/22.
//

import Foundation

public protocol ViewCodeProtocol {

    func setupHierarchy()
    func setupConstraints()
    func setupConfigurations()
}

public extension ViewCodeProtocol {

    func setupView() {
        setupHierarchy()
        setupConstraints()
        setupConfigurations()
    }

    func setupConfigurations() {}
}
