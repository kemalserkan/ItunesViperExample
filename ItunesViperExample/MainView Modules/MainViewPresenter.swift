//
//  MainViewPresenter.swift
//  ItunesViperExample
//
//  Created by Kemal Serkan YILDIRIM on 5.07.2019.
//  Copyright © 2019 Kemal Serkan YILDIRIM. All rights reserved.
//

import Foundation

protocol MainViewPresenterProtocol {
    func load()
    func selecttrack(at index: Int)
}

enum MainViewPresenterOutput {
    case setLoading(Bool)
    case getMediaList(medias: Search)
}

final class MainViewPresenter {
    
    weak private var view: MainViewProtocol?
    var interactor: MainViewInteractorProtocol
    private let router: MainViewRouterProtocol
    
    init(view: MainViewProtocol, interactor: MainViewInteractorProtocol, router: MainViewRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        
        self.interactor.delegate = self
    }
}

extension MainViewPresenter : MainViewPresenterProtocol {
    
    func selecttrack(at index: Int) {
        interactor.selecttrack(at: index)
    }
    
    func load() {
        interactor.load()
    }
}

extension MainViewPresenter : MainViewInteractorDelegate {
    func handleOutput(_ output: MainViewInteractorOutput) {
        switch output {
        case .setLoading(let isLoading):
            view?.handleOutput(.setLoading(isLoading))
        case .getMediaList(let medias):
            view?.handleOutput(.getMediaList(medias: medias))
        case .showtrackDetail(let track):
            router.navigate(.list(track))
        }
    }
}
