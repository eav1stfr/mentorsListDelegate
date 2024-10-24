//
//  MediaContentCell.swift
//  ProtocolsDelegateAndMVC
//
//  Created by Askar Ulubayev on 19.10.2024.
//

import UIKit

final class MediaContentCell: UITableViewCell {
    private let postImageView = UIImageView()
    private let contentStackView = UIStackView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(content: MediaContent) {
        postImageView.image = content.image
        titleLabel.text = content.title
        descriptionLabel.text = content.description
    }
}

extension MediaContentCell {
    func setupSubviews() {
        addSubviews()
        setupSubviewsConstraints()
        addSubviewsStyles()
    }
    
    func addSubviews() {
        addSubview(postImageView)
        addSubview(contentStackView)
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(descriptionLabel)
    }
    
    func setupSubviewsConstraints() {
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            postImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -8),
            postImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            postImageView.widthAnchor.constraint(equalToConstant: 50),
            postImageView.heightAnchor.constraint(equalToConstant: 80),
            
            contentStackView.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
            contentStackView.centerYAnchor.constraint(equalTo: postImageView.centerYAnchor)
        ])
    }
    
    func addSubviewsStyles() {
        postImageView.contentMode = .scaleAspectFill
        
        contentStackView.axis = .vertical
        contentStackView.spacing = 8
        contentStackView.alignment = .fill
        contentStackView.distribution = .fill
        
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 1
        titleLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 1
        descriptionLabel.font = .systemFont(ofSize: 12, weight: .regular)
    }
}

