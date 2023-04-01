//
//  AgentDetailsView.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 17/12/22.
//

import Foundation
import UIKit

class AgentsDetailsView: UIView {
    
    // MARK: - Private Properties
        
    private lazy var collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.sectionInset = .init(top: 8, left: 0, bottom: 8, right: 0)
        viewLayout.itemSize = .init(width: 70, height: 70)
        viewLayout.minimumInteritemSpacing = 20
        viewLayout.scrollDirection = .horizontal
    
        let element = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .clear
        
        element.showsHorizontalScrollIndicator = false
        element.delegate = self
        element.dataSource = self
        return element
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var contentView: UIView = {
        let element = UIView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .clear
        return element
    }()
    
    private lazy var contentImage: UIView = {
        let element = UIView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .clear
        return element
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 32, bottom: 0, right: 32)
        stackView.backgroundColor = .clear
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = .zero
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var roleStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var agentImageView: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .clear
        element.contentMode = .scaleAspectFill
        return element
    }()
    
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .clear
        element.contentMode = .scaleAspectFill
        return element
    }()
    
    private lazy var nameLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
//        element.font = .valorantFont(size: 32)
        element.font = UIFont.systemFont(ofSize: 56, weight: .heavy)
        element.textColor = .white
        element.numberOfLines = 1
        element.textAlignment = .left
        return element
    }()
    
    private lazy var roleImageView: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .clear
        element.contentMode = .scaleAspectFill
        return element
    }()

    private lazy var subtitleLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
//        element.font = .nunito(style: .regular, size: 10)
        element.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        element.textColor = .white
        element.numberOfLines = 1
        element.textAlignment = .left
        element.text = "Duelista"
        return element
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
//        element.font = .nunito(style: .regular, size: 10)
        element.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        element.textColor = .white
        element.numberOfLines = 0
        element.textAlignment = .left
        return element
    }()
    
    private lazy var abilitiesStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 32, bottom: 0, right: 32)
        stackView.backgroundColor = .clear
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = .zero
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var abilitiesTitle: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
//        element.font = .valorantFont(size: 32)
        element.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        element.textColor = .white
        element.numberOfLines = 1
        element.textAlignment = .center
        element.text = "Habilidades"
        return element
    }()
    
    private lazy var abilitiesView: AbilitiesView = {
        let element = AbilitiesView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .clear
        return element
    }()
    
    var currentIndexSelected: IndexPath = .init(row: 0, section: 0)
    
    private var agent: [AgentsDetailsModel.Skills] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(viewModel: AgentsDetailsModel.AgentDetailsViewModel) {
        agent = viewModel.skills
        nameLabel.text = viewModel.nameAgent
        subtitleLabel.text = viewModel.roleName
        descriptionLabel.text = viewModel.descriptionAgent
        
        abilitiesView.descritionText = viewModel.skills[0].description
        abilitiesView.abilitiesText = viewModel.skills[0].name
        
        agentImageView.addImageFromURL(urlString: viewModel.image)
        roleImageView.addImageFromURL(urlString: viewModel.roleIcon)
        backgroundImageView.addImageFromURL(urlString: viewModel.backgroundImage)
    }
}

extension AgentsDetailsView: ViewCodeProtocol {
    
    func setupHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(contentImage)
        contentImage.addSubview(backgroundImageView)
        contentImage.addSubview(agentImageView)
        scrollView.addSubview(contentStackView)
        scrollView.addSubview(collectionView)
        scrollView.addSubview(abilitiesView)
        
        roleStackView.addArrangedSubviews([roleImageView, subtitleLabel])
        contentStackView.addArrangedSubviews([nameLabel, roleStackView, descriptionLabel, abilitiesTitle])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            contentImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentImage.heightAnchor.constraint(equalToConstant: 450),
            
            backgroundImageView.topAnchor.constraint(equalTo: contentImage.topAnchor),
            backgroundImageView.centerYAnchor.constraint(equalTo: contentImage.centerYAnchor),
            backgroundImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 320),
            backgroundImageView.widthAnchor.constraint(equalToConstant: 300),
            
            agentImageView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 20),
            agentImageView.centerYAnchor.constraint(equalTo: contentImage.centerYAnchor),
            agentImageView.centerXAnchor.constraint(equalTo: contentImage.centerXAnchor),
            agentImageView.heightAnchor.constraint(equalToConstant: 300),
            agentImageView.widthAnchor.constraint(equalToConstant: 320),
            
            contentStackView.topAnchor.constraint(equalTo: contentImage.bottomAnchor, constant: -50),
            contentStackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentStackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            
            collectionView.topAnchor.constraint(equalTo: contentStackView.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 32),
            collectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -32),
            collectionView.heightAnchor.constraint(equalToConstant: 90),
            
            abilitiesView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 32),
            abilitiesView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 32),
            abilitiesView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -32),
            abilitiesView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50),
            
            roleStackView.widthAnchor.constraint(equalToConstant: 100),
            roleImageView.widthAnchor.constraint(equalToConstant: 20),
            roleImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func setupConfigurations() {
        backgroundColor = UIColor(rgb: 0x0F1922)
 
        contentStackView.setCustomSpacing(32, after: descriptionLabel)
        contentStackView.setCustomSpacing(24, after: roleStackView)
        roleStackView.setCustomSpacing(8, after: roleImageView)

        collectionView.register(AbilitiesCell.self, forCellWithReuseIdentifier: AbilitiesCell.identifier)
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension AgentsDetailsView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return agent.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AbilitiesCell.identifier, for: indexPath) as? AbilitiesCell else {
            return UICollectionViewCell()
        }

        cell.setupCell(agent[indexPath.item])
        
        if indexPath.item == 0 {
            cell.updateBackgroundColor(isSelected: true)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        abilitiesView.descritionText = agent[indexPath.item].description
        abilitiesView.abilitiesText = agent[indexPath.item].name
        
        if let cell = collectionView.cellForItem(at: currentIndexSelected) as? AbilitiesCell {
            cell.updateBackgroundColor(isSelected: false)
            currentIndexSelected = indexPath
        }
    }
}
