//
//  AbilitiesView.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 23/12/22.
//

import Foundation
import UIKit

class AbilitiesView: UIView {
        
    private lazy var abilitiesStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.layoutMargins = UIEdgeInsets(top: 24, left: 16, bottom: 24, right: 16)
        stackView.backgroundColor = .clear
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = .zero
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var abilitiesLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        element.textColor = .white
        element.numberOfLines = 1
        element.textAlignment = .left
        return element
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        element.textColor = .white
        element.numberOfLines = 0
        element.textAlignment = .left
        return element
    }()
    
    var descritionText: String = "" {
        didSet {
            descriptionLabel.text = self.descritionText
        }
    }
    
    var abilitiesText: String = "" {
        didSet {
            abilitiesLabel.text = self.abilitiesText
        }
    }
        
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewCodeProtocol

extension AbilitiesView: ViewCodeProtocol {
    
    func setupHierarchy() {
        addSubview(abilitiesStackView)
        abilitiesStackView.addArrangedSubviews([abilitiesLabel, descriptionLabel])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            abilitiesStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            abilitiesStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            abilitiesStackView.topAnchor.constraint(equalTo: topAnchor),
            abilitiesStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupConfigurations() {
        abilitiesStackView.setCustomSpacing(24, after: abilitiesLabel)
        layer.borderWidth = 3
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 16
    }
}
