//
//  MediaContentsService.swift
//  ProtocolsDelegateAndMVC
//
//  Created by Askar Ulubayev on 19.10.2024.
//

import UIKit

protocol MediaContentsServiceObserver: AnyObject {
    func update(content: MediaContent)
}

final class MediaContentsServiceObserverWrapper {
    weak var observer: MediaContentsServiceObserver?
    
    init(observer: MediaContentsServiceObserver? = nil) {
        self.observer = observer
    }
}

final class MediaContentsService {
    private var observers: [MediaContentsServiceObserverWrapper] = []
    
    func getMainMediaContents() -> [MediaContent] {
        let contents: [MediaContent] = [
            Movie(name: "Deadpool & Wolverine", releaseYear: 2024, rating: "7.5", image: UIImage(named: "Deadpool")),
            Movie(name: "Inside Out 2", releaseYear: 2024, rating: "7.2", image: UIImage(named: "Inside_Out")),
            TVShow(name: "Breaking Bad", startYear: 2008, finishYear: 2012, numberOfSeasons: 5, image: UIImage(named: "Breaking_Bad"), rating: "8.5"),
            TVShow(name: "Arcane", startYear: 2021, finishYear: nil, numberOfSeasons: 2, image: UIImage(named: "Arcane"), rating: "8.2"),
        ]
        return contents
    }
    
    func imageTapped(content: MediaContent) {
        var newContent = content
        newContent.rating = "0.0"
        for observer in observers {
            observer.observer?.update(content: newContent)
        }
    }
    
    func add(observer: MediaContentsServiceObserver) {
        observers.append(MediaContentsServiceObserverWrapper(observer: observer))
    }
}

