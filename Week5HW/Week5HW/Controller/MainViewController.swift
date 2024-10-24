import UIKit
import Foundation

final class MainViewController: UIViewController {
    private let listView = MentorsListView()
    private let mentorsInfoService = MentorsInfoService()
    
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
        
        mentorsInfoService.add(observer: self)
        listView.configure(contents: mentorsInfoService.getMainMentorsInfo())
        listView.delegate = self
    }
}

extension MainViewController: MentorsInfoServiceObserver {
    
}

extension MainViewController: MentorsViewDelegate {
    func mentorsListViewDidSelect(content: MentorInfo) {
        <#code#>
    }
    
    
}
