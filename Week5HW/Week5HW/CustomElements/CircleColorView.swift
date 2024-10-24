import Foundation
import UIKit

final class CustomCircle: UIView {
    init(_ frame: CGRect, _ char: Character, _ backgroundColor: UIColor) {
        super.init(frame: frame)
        
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = frame.size.width/2
        self.layer.masksToBounds = true
        
        let label = UILabel()
        label.text = String(char)
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: frame.size.width/2)
        
        label.frame = self.bounds
        self.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
