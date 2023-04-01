//
//  EmptyAgentView.swift
//  Valorant Guide
//
//  Created by Hellen Caroline  on 01/01/23.
//

import UIKit

class EmptyAgentView: UIView {
    
    // MARK: - UI
    
    private lazy var logo: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "not-found")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "Não foi encontrado resultados"
        return label
    }()
    
    private lazy var subtitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 18)
        label.text = "Tente uma nova pesquisa"
        return label
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
}

// MARK: - ViewCodeProtocol Extension

extension EmptyAgentView: ViewCodeProtocol {
    
    func setupHierarchy() {
        addSubview(logo)
        addSubview(title)
        addSubview(subtitle)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            logo.centerXAnchor.constraint(equalTo: centerXAnchor),
            logo.heightAnchor.constraint(equalToConstant: 128),
            logo.widthAnchor.constraint(equalToConstant: 128),
            
            title.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 8),
            title.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            title.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
            subtitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            subtitle.rightAnchor.constraint(equalTo: rightAnchor, constant: -16)
        ])
    }
}
