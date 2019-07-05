//
//  MainViewInteractor.swift
//  ItunesViperExample
//
//  Created by Kemal Serkan YILDIRIM on 5.07.2019.
//  Copyright © 2019 Kemal Serkan YILDIRIM. All rights reserved.
//

import UIKit

// MARK: Interactor -
protocol MainViewInteractorProtocol {
    
    var delegate: MainViewInteractorDelegate? { get set }
    func load()
    func selecttrack(at index: Int)
}

protocol MainViewInteractorDelegate: class {
    func handleOutput(_ output: MainViewInteractorOutput)
}

enum MainViewInteractorOutput {
    case setLoading(Bool)
    case getMediaList(Search)
    case showtrackDetail(Media)
}

final class MainViewInteractor {
    
    weak var delegate: MainViewInteractorDelegate?
    private var tracks: Search!
}

extension  MainViewInteractor :  MainViewInteractorProtocol {
    
    func load() {
        delegate?.handleOutput(.setLoading(true))
        
        ServiceProvider.getSongList(onSuccess: { result in
            self.delegate?.handleOutput(.setLoading(false))
            self.tracks = result
            self.delegate?.handleOutput(.getMediaList(result))
        }) { error in
            
        }
        
    }
    
    func selecttrack(at index: Int) {
        let track = tracks.results[index]
        delegate?.handleOutput(.showtrackDetail(track))
    }
    
}
