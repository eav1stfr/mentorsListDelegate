//
//  MentorsListVC.swift
//  hwFiveFinalVersion
//
//  Created by Александр Эм on 24.10.2024.
//

import UIKit

class MentorsListVC: UIViewController {
    
    private let tableView = UITableView()
    
    private let mentorsList: [String] = ["Amirzhan", "Yersin", "Abrorbek", "Medeo", "Yedige", "Alisher"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mentors App"
        configureTableView()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(MentorCustomCell.self, forCellReuseIdentifier: "MentorCustomCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension MentorsListVC: UITableViewDelegate {
    
}

extension MentorsListVC: UITableViewDataSource {
    
    //how many cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mentorsList.count
    }
    
    //what cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MentorCustomCell") as! MentorCustomCell
        let name = mentorsList[indexPath.row]
        cell.set(name: name)
        
        return cell
    }
    
    
}
