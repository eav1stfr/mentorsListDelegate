//
//  MentorCustomCell.swift
//  hwFiveFinalVersion
//
//  Created by Александр Эм on 24.10.2024.
//

import UIKit

class MentorCustomCell: UITableViewCell {
    
    private let mentorNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(mentorNameLabel)
        setLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(name: String) {
        mentorNameLabel.text = name
    }
    
    private func setLabelConstraints() {
        NSLayoutConstraint.activate([
            mentorNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            mentorNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            mentorNameLabel.heightAnchor.constraint(equalToConstant: 80),
            mentorNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
