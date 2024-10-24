//
//  MediaContentsListView.swift
//  ProtocolsDelegateAndMVC
//
//  Created by Askar Ulubayev on 19.10.2024.
//

import UIKit

protocol MediaContentsListViewDelegate: AnyObject {
    func mediaContentsListViewDidSelect(content: MediaContent)
}

final class MediaContentsListView: UIView {
    
    weak var delegate: MediaContentsListViewDelegate?
    
    private let tableView = UITableView()
    private var contents: [MediaContent] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(contents: [MediaContent]) {
        self.contents = contents
        tableView.reloadData()
    }
    
    func update(content: MediaContent) {
        guard let contentIndex = contents.firstIndex(where: { $0.title == content.title }) else {
            return
        }
        contents[contentIndex] = content
        tableView.reloadData()
    }
}

extension MediaContentsListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let contentCell = tableView.dequeueReusableCell(
            withIdentifier: "MediaContentCell",
            for: indexPath
        ) as? MediaContentCell else {
            return UITableViewCell()
        }
        contentCell.configure(content: contents[indexPath.row])
        return contentCell
    }
}

extension MediaContentsListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.mediaContentsListViewDidSelect(content: contents[indexPath.row])
    }
}

private extension MediaContentsListView {
    func setupSubviews() {
        addSubviews()
        setupSubviewsConstraints()
        addSubviewsStyles()
    }
    
    func addSubviews() {
        addSubview(tableView)
    }
    
    func setupSubviewsConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func addSubviewsStyles() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MediaContentCell.self, forCellReuseIdentifier: "MediaContentCell")
    }
}

