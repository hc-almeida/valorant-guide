//
//  AgentListView.swift
//  ValorantGuide
//
//  Created by Hellen Caroline  on 13/12/22.
//

import UIKit

protocol AgentListViewDelegate: AnyObject {
    func didSelectedAgent(at index: Int)
    func isFavorite(id: String) -> Bool
    func didTapFavorite(id: String, isFavorite: Bool)
}

class AgentListView: UIView {
    
    private lazy var emptyListView: EmptyAgentView = {
        let view = EmptyAgentView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
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
    
    private var isFirsCharactersLoad: Bool = true
    weak var delegate: AgentListViewDelegate?
    private var agentList: [AgentsListModel.AgentViewModel] = []
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods

    public func reloadData() {
        collectionView.reloadData()
    }
    
    func setupUI(_ viewModel: [AgentsListModel.AgentViewModel]) {
        agentList = viewModel
        isFirsCharactersLoad = false
        collectionView.reloadData()
    }
}

// MARK: - ViewCodeProtocol

extension AgentListView: ViewCodeProtocol {

    func setupHierarchy() {
        addSubview(collectionView)
        addSubview(emptyListView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            emptyListView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            emptyListView.leadingAnchor.constraint(equalTo: leadingAnchor),
            emptyListView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32)
        ])
    }
    
    func setupConfigurations() {
//        backgroundColor = UIColor(hex: "#0F1922")  -> Escuro
        emptyListView.isHidden = true
        backgroundColor = UIColor(rgb: 0x0F1922)
        collectionView.register(AgentItemCell.self, forCellWithReuseIdentifier: AgentItemCell.identifier)
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension AgentListView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        agentList.isEmpty
            ? collectionView.setupEmptyEmptyView("agents nao carregado")
            : collectionView.removeBackGroundView()
        
        return agentList.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AgentItemCell.identifier, for: indexPath) as? AgentItemCell else { return UICollectionViewCell() }
        
        var isFavorite = false
        
        if let value = delegate?.isFavorite(id: agentList[indexPath.row].id) {
            isFavorite = value
        }
                
        cell.configureCell(agentList[indexPath.row], isFavorite: isFavorite)
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectedAgent(at: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        cell.alpha = 0.0
        cell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)

        UIView.animate(withDuration: 0.4, delay: 0.0, options: .allowUserInteraction, animations: {
            cell.alpha = 1.0
            cell.transform = .identity
        })
    }
}

// MARK: - AgentItemCellDelegate

extension AgentListView: AgentItemCellDelegate {
    
    func didTapFavorite(id: String, isFavorite: Bool) {
        delegate?.didTapFavorite(id: id, isFavorite: isFavorite)
    }
}
