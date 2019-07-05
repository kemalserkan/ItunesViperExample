//
//  MainDetailPresenter.swift
//  ItunesViperExample
//
//  Created by Kemal Serkan YILDIRIM on 5.07.2019.
//  Copyright © 2019 Kemal Serkan YILDIRIM. All rights reserved.
//

import UIKit

protocol MainDetailPresenterProtocol {
    func load()
}

protocol MainDetailViewProtocol {
    func update(_ presentation: Media)
}

class MainDetailPresenter {
    
    var view: MainDetailViewProtocol?
    private let media: Media
    
    init(view: MainDetailViewProtocol, media: Media) {
        self.view = view
        self.media = media
    }
    
}

extension MainDetailPresenter: MainDetailPresenterProtocol {
    func load() {
        view?.update(media)
    }
}
