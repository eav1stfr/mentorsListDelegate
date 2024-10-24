import Foundation
import UIKit

final class MentorDetailViewController: UIViewController {
    private let mentorInfoService: MentorsInfoService
    private var content: MentorInfo
    
    
    private var name = UILabel()
    
    
    private let colors: [UIColor] = [.black, .blue, .orange, .purple, .white, .brown, .green, .red, .systemPink]
    
    private let horizontalStackOfColorsOne: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let horizontalStackOfColorsTwo: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    init(mentorInfoService: MentorsInfoService, content: MentorInfo) {
        self.mentorInfoService = mentorInfoService
        self.content = content
        super.init(nibName: nil, bundle: nil)
    }
    
    private lazy var circleChar = CustomCircle(CGRect(), content.name.first ?? Character(""), .blue)
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func updateContent() {
        
    }
}

extension MentorDetailViewController: MentorsInfoServiceObserver {
    func update(content: MentorInfo) {
        guard self.content.name == content.name else {
            return
        }
        self.content = content
        upd
    }
}

extension MentorDetailViewController {
    private func setupView() {
        
    }
    
    private func setupColorsStack() {
        for i in 0...3 {
            let button: UIButton = {
                let button = UIButton()
                button.tag = i
                button.setTitle(content.shortName, for: .normal)
                button.setTitleColor(.white, for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
                button.backgroundColor = colors[i]
                button.widthAnchor.constraint(equalToConstant: 100).isActive = true
                button.heightAnchor.constraint(equalToConstant: 100).isActive = true
                
                button.addTarget(self, action: #selector(colorButtonTapped), for: .touchUpInside)
                button.layer.cornerRadius = 50
                button.layer.masksToBounds = true
                
                return button
            }()
            horizontalStackOfColorsOne.addArrangedSubview(button)
        }
        
        for i in 4...7 {
            let button: UIButton = {
                let button = UIButton()
                button.tag = i
                button.setTitle(content.shortName, for: .normal)
                button.setTitleColor(.white, for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
                button.backgroundColor = colors[i]
                button.widthAnchor.constraint(equalToConstant: 100).isActive = true
                button.heightAnchor.constraint(equalToConstant: 100).isActive = true
                
                button.addTarget(self, action: #selector(colorButtonTapped), for: .touchUpInside)
                button.layer.cornerRadius = 50
                button.layer.masksToBounds = true
                
                return button
            }()
            horizontalStackOfColorsTwo.addArrangedSubview(button)
        }
    }
    
    @objc private func colorButtonTapped(_ sender: UIButton) {
        
    }
}
