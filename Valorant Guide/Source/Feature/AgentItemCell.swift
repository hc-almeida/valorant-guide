//
//  AgentItemCell.swift
//  ValorantGuide
//
//  Created by Hellen Caroline  on 13/12/22.
//

import UIKit

protocol AgentItemCellDelegate: AnyObject {
    func didTapFavorite(id: String, isFavorite: Bool)
}

class AgentItemCell: UICollectionViewCell {
    
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
    
    private lazy var favoriteButton: FavoriteButton = {
        let element = FavoriteButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(didTapFavorite), for: .touchUpInside)
        return element
    }()
    
    private var identifier = ""
    weak var delegate: AgentItemCellDelegate?
    
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
    
    public func configureCell(_ viewModel: AgentsListModel.AgentViewModel, isFavorite: Bool) {
        DispatchQueue.main.async {
            
            let firstColor = (viewModel.backgroundGradient.first ?? "")
            let lastColor = (viewModel.backgroundGradient.last ?? "")
            
            self.nameLabel.text = viewModel.nameAgent
            self.subtitleLabel.text = viewModel.roleName
            self.imageView.addImageFromURL(urlString: viewModel.image)
            self.cardView.setBackground(colorFirst: UIColor(hex: "#\(firstColor)") ?? .white,
                                        colorLast: UIColor(hex: "#\(lastColor)") ?? .white)
            
            self.favoriteButton.agentId = viewModel.id
            self.favoriteButton.isFavorite = isFavorite
        }
    }
    
    // MARK: Actions
    
    @objc
    private func didTapFavorite() {
        favoriteButton.toggleState()
        delegate?.didTapFavorite(id: favoriteButton.agentId,
                                 isFavorite: favoriteButton.isFavorite)
    }
      
    private func clearForReuse() {
        nameLabel.text = nil
        subtitleLabel.text = nil
        imageView.image = nil
    }
}

// MARK: - ViewCodeProtocol

extension AgentItemCell: ViewCodeProtocol {
    
    public func setupHierarchy() {
        addSubview(containerView)
        containerView.addSubview(cardView)
        containerView.addSubview(imageView)
        containerView.addSubview(subtitleLabel)
        containerView.addSubview(nameLabel)
        containerView.addSubview(favoriteButton)
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
            
            
            favoriteButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            favoriteButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -6),
            favoriteButton.heightAnchor.constraint(equalToConstant: 30),
            favoriteButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }

    public func setupConfigurations() {
        cardView.layer.cornerRadius = 10
        cardView.clipsToBounds = true
    }
}
