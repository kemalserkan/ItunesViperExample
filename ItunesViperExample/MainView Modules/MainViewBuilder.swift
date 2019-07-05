//
//  MainViewBuilder.swift
//  ItunesViperExample
//
//  Created by Kemal Serkan YILDIRIM on 5.07.2019.
//  Copyright © 2019 Kemal Serkan YILDIRIM. All rights reserved.
//

import UIKit

class MainViewBuilder {
    
    static func make() -> MainViewController {
        let storyBoard = UIStoryboard(name: "MainViewStoryboard", bundle: nil)
        let view: MainViewController = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        let interactor = MainViewInteractor()
        let router = MainViewRouter(view: view)
        let presenter = MainViewPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        
        return view
    }
}
