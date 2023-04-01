//
//  AbilitiesCell.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 24/12/22.
//

import UIKit

class AbilitiesCell: UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    private lazy var cardView: UIView = {
        let element = UIView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .clear
        element.layer.borderWidth = 3
        element.layer.borderColor = UIColor.white.cgColor
        element.layer.cornerRadius = 8
        return element
    }()
    
    private lazy var imageView: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.contentMode = .scaleAspectFit
        return element
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    public required init?(coder: NSCoder) {
        nil
    }
    
    func setupCell(_ viewModel: AgentsDetailsModel.Skills) {
        imageView.addImageFromURL(urlString: viewModel.displayIcon)
    }

    override var isSelected: Bool {
        didSet {
            updateBackgroundColor(isSelected: isSelected)
        }
    }
    
    func updateBackgroundColor(isSelected: Bool) {
        backgroundColor = isSelected ? .red : .clear
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundColor = .clear
    }
}

// MARK: - ViewCodeProtocol

extension AbilitiesCell: ViewCodeProtocol {
    
    func setupHierarchy() {
        addSubview(cardView)
        cardView.addSubview(imageView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: topAnchor),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor),

            imageView.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 40),
            imageView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setupConfigurations() {
        layer.cornerRadius = 8
    }
}
