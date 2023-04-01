//
//  FavoritesCell.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 25/02/23.
//

import UIKit

protocol FavoritesCellDelegate: AnyObject {
    func didTapRemove(id: String)
}

class FavoritesCell: UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    // MARK: - Private Properties
    
    private lazy var containerView: UIView = {
        let element = UIView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .clear
        return element
    }()
    
    private lazy var cardView: UIView = {
        let element = UIView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .systemGray
        return element
    }()
    
    private lazy var imageView: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .clear
        element.contentMode = .scaleAspectFill
        return element
    }()
    
    private lazy var nameLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
//        element.font = UIFont(name: "Valorant-Font", size: 28)
        element.font = UIFont.systemFont(ofSize: 28, weight: .heavy)
        element.textColor = .white
        element.numberOfLines = 1
        element.textAlignment = .left
        return element
    }()

    private lazy var subtitleLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        element.textColor = .white
        element.numberOfLines = 1
        element.textAlignment = .left
        return element
    }()
    
    private lazy var removeButton: UIButton = {
        let element = UIButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(didTapRemove), for: .touchUpInside)
        element.setImage(.makeWith(systemImage: .trashFill, color: .white), for: .normal)
        return element
    }()
    
    private var identifier = ""
    weak var delegate: FavoritesCellDelegate?
    
    // MARK: - Inits

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    public required init?(coder: NSCoder) {
        nil
    }
    
    override func prepareForReuse() {
        clearForReuse()
    }
    
    public func configureFavoriteCell(_ viewModel: FavoriteAgent) {
        DispatchQueue.main.async {
            let color = (viewModel.color ?? "")
            let finalColor = UIColor(hex: "#\(color)") ?? .white
            self.identifier = viewModel.id ?? ""
            
            self.nameLabel.text = viewModel.name
            self.subtitleLabel.text = viewModel.roleName
            self.imageView.addImageFromURL(urlString: viewModel.image ?? "")
            self.cardView.backgroundColor = finalColor.withAlphaComponent(0.7)
        }
    }

    // MARK: Actions
    
    @objc
    private func didTapRemove() {
        delegate?.didTapRemove(id: identifier)
    }
      
    private func clearForReuse() {
        nameLabel.text = nil
        subtitleLabel.text = nil
        imageView.image = nil
    }
}

// MARK: - ViewCodeProtocol

extension FavoritesCell: ViewCodeProtocol {
    
    public func setupHierarchy() {
        addSubview(containerView)
        containerView.addSubview(cardView)
        containerView.addSubview(imageView)
        containerView.addSubview(subtitleLabel)
        containerView.addSubview(nameLabel)
        containerView.addSubview(removeButton)
    }

    public func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),

            cardView.heightAnchor.constraint(equalToConstant: 195),
            cardView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            imageView.heightAnchor.constraint(equalToConstant: 245),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -50),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            subtitleLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            nameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -6),
            
            removeButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            removeButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -6),
            removeButton.heightAnchor.constraint(equalToConstant: 30),
            removeButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }

    public func setupConfigurations() {
        cardView.layer.cornerRadius = 10
        cardView.clipsToBounds = true
    }
}
