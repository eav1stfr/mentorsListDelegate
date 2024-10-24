//
//  MainViewController.swift
//  ProtocolsDelegateAndMVC
//
//  Created by Askar Ulubayev on 19.10.2024.
//

import UIKit

final class MainViewController1: UIViewController, MediaContentsServiceObserver, MediaContentsListViewDelegate {

    private let listView = MediaContentsListView()
    private let mediaContentsService = MediaContentsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Main"
        view.backgroundColor = .white
        
        view.addSubview(listView)
        listView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            listView.topAnchor.constraint(equalTo: view.topAnchor),
            listView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            listView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            listView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        mediaContentsService.add(observer: self)
        listView.configure(contents: mediaContentsService.getMainMediaContents())
        listView.delegate = self
    }
}

extension MainViewController: MediaContentsListViewDelegate {
    func mediaContentsListViewDidSelect(content: MediaContent) {
        let detailsViewController = MediaContentDetailsViewController(mediaContentsService: mediaContentsService, content: content)
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}

extension MainViewController: MediaContentsServiceObserver {
    func update(content: MediaContent) {
        listView.update(content: content)
    }
}
