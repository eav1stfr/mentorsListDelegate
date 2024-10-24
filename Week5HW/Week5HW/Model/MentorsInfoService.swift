import Foundation
import UIKit

protocol MentorsInfoServiceObserver: AnyObject {
    func update(content: MentorInfo)
}

final class MentorsInfoServiceObserverWrapper {
    weak var observer: MentorsInfoServiceObserver?
    
    init(observer: MentorsInfoServiceObserver? = nil) {
        self.observer = observer
    }
}

final class MentorsInfoService {
    private var observers: [MentorsInfoServiceObserverWrapper] = []
    
    func getMainMentorsInfo() -> [MentorInfo] {
        let contents: [MentorInfo] = [
            Mentor(name: "Amirzhan", backgroundColor: .black),
            Mentor(name: "Yersin", backgroundColor: .blue),
            Mentor(name: "Abrorbek", backgroundColor: .orange),
            Mentor(name: "Yedige", backgroundColor: .purple),
            Mentor(name: "Medeo", backgroundColor: .white)
        ]
        return contents
    }
    
    func nameTapped(content: MentorInfo) {
        var newContent = content
        newContent.name = "Hello"
        for observer in observers {
            observer.observer?.update(content: newContent)
        }
    }
    
    func add(observer: MentorsInfoServiceObserver) {
        observers.append(MentorsInfoServiceObserverWrapper(observer: observer))
    }
}
