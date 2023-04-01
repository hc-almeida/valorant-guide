//
//  FavoritesView.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 20/01/23.
//

import Foundation
import UIKit

protocol FavoritesViewDelegate: AnyObject {
    func didTapRemove(id: String)
}

final class FavoritesView: UIView {
    
    private lazy var collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.sectionInset = .init(top: 32, left: 0, bottom: 16, right: 0)
        viewLayout.itemSize = .init(width: (UIScreen.main.bounds.width - 60) / 2, height: 250)
        viewLayout.minimumInteritemSpacing = 16
        viewLayout.minimumLineSpacing = 50

        let element = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .clear
        element.showsVerticalScrollIndicator = false
        element.delegate = self
        element.dataSource = self
        return element
    }()
    
    weak var delegate: FavoritesViewDelegate?
    private var favoriteAgent: [FavoriteAgent] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(_ viewModel: [FavoriteAgent]) {
        favoriteAgent = viewModel
        collectionView.reloadData()
    }
    
    public func reloadData() {
        collectionView.reloadData()
    }
}

// MARK: - ViewCodeProtocol

extension FavoritesView: ViewCodeProtocol {
    
    func setupHierarchy() {
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32)
        ])
    }
    
    func setupConfigurations() {
        backgroundColor = UIColor(rgb: 0x0F1922)
        collectionView.register(FavoritesCell.self, forCellWithReuseIdentifier: FavoritesCell.identifier)
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension FavoritesView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        favoriteAgent.isEmpty
            ? collectionView.setupEmptyEmptyView("Nenhum agente salvo")
            : collectionView.removeBackGroundView()
        
        return favoriteAgent.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoritesCell.identifier, for: indexPath) as? FavoritesCell else { return UICollectionViewCell() }
        
        cell.configureFavoriteCell(favoriteAgent[indexPath.row])
        cell.delegate = self
        
        return cell
    }
}

// MARK: - FavoritesCellDelegate

extension FavoritesView: FavoritesCellDelegate {
    
    func didTapRemove(id: String) {
        delegate?.didTapRemove(id: id)
    }
}
