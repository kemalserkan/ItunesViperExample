//
//  MainDetailBuilder.swift
//  ItunesViperExample
//
//  Created by Kemal Serkan YILDIRIM on 5.07.2019.
//  Copyright © 2019 Kemal Serkan YILDIRIM. All rights reserved.
//

import UIKit

class MainDetailBuilder {
    
    static func make(media: Media) -> MainDetailViewController {
        let storyBoard = UIStoryboard(name: "MainDetail", bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier: "MainDetailViewController") as! MainDetailViewController
        let presenter = MainDetailPresenter(view: view as MainDetailViewProtocol, media: media)
        
        view.presenter = presenter
        
        return view
    }
}
