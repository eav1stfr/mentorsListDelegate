import Foundation
import UIKit

protocol MentorsViewDelegate: AnyObject {
    func mentorsListViewDidSelect(content: MentorInfo)
}

final class MentorsListView: UIView {
    weak var delegate: MentorsViewDelegate?
    
    private let tableView = UITableView()
    private var contents: [MentorInfo] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(contents: [MentorInfo]) {
        self.contents = contents
        tableView.reloadData()
    }
    
    func update(content: MentorInfo) {
        guard let contentIndex = contents.firstIndex(where: {$0.name == content.name}) else {
            return
        }
        contents[contentIndex] = content
        tableView.reloadData()
    }
}

extension MentorsListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let contentCell = tableView.dequeueReusableCell(withIdentifier: "MentorInfoTableCell", for: indexPath) as? MentorInfoTableCell else {
            return UITableViewCell()
        }
        contentCell.configure(content: contents[indexPath.row])
        return contentCell
    }
}

extension MentorsListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.mentorsListViewDidSelect(content: contents[indexPath.row])
    }
}

private extension MentorsListView {
    func setupView() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MentorInfoTableCell.self, forCellReuseIdentifier: "MentorInfoTableCell")
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
