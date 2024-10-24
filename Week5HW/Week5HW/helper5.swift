//
//  MediaContentDetailsViewController.swift
//  ProtocolsDelegateAndMVC
//
//  Created by Askar Ulubayev on 19.10.2024.
//

import UIKit

final class MediaContentDetailsViewController: UIViewController {
    private let mediaContentsService: MediaContentsService
    private var content: MediaContent
    
    private let postImageView = UIImageView()
    private let contentStackView = UIStackView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()

    init(mediaContentsService: MediaContentsService, content: MediaContent) {
        self.mediaContentsService = mediaContentsService
        self.content = content
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        mediaContentsService.add(observer: self)
        
        updateContent()
        postImageView.isUserInteractionEnabled = true
        postImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
    }
    
    private func updateContent() {
        postImageView.image = content.image
        titleLabel.text = content.title
        descriptionLabel.text = content.description
    }

    @objc private func imageTapped() {
        mediaContentsService.imageTapped(content: content)
    }
}

extension MediaContentDetailsViewController: MediaContentsServiceObserver {
    func update(content: MediaContent) {
        guard self.content.title == content.title else {
            return
        }
        self.content = content
        updateContent()
    }
}

extension MediaContentDetailsViewController {
    func setupSubviews() {
        addSubviews()
        setupSubviewsConstraints()
        addSubviewsStyles()
    }
    
    func addSubviews() {
        view.addSubview(postImageView)
        view.addSubview(contentStackView)
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(descriptionLabel)
    }
    
    func setupSubviewsConstraints() {
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            postImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            postImageView.widthAnchor.constraint(equalToConstant: 50),
            postImageView.heightAnchor.constraint(equalToConstant: 80),
            
            contentStackView.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            contentStackView.centerYAnchor.constraint(equalTo: postImageView.centerYAnchor)
        ])
    }
    
    func addSubviewsStyles() {
        view.backgroundColor = .white

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
