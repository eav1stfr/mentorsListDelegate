//
//  Model.swift
//  Week5HW
//
//  Created by Александр Эм on 24.10.2024.
//

import Foundation
import UIKit

protocol MentorInfo {
    var name: String { get set }
    var shortName: String { get }
    var backgroundColor: UIColor { get set }
}

struct Mentor {
    var name: String
    var backgroundColor: UIColor
}

extension Mentor: MentorInfo {
    var shortName: String {
        if let short = name.first {
            return String(short)
        } else {
            return ""
        }
    }
}
