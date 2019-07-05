//
//  MainViewRouter.swift
//  ItunesViperExample
//
//  Created by Kemal Serkan YILDIRIM on 5.07.2019.
//  Copyright © 2019 Kemal Serkan YILDIRIM. All rights reserved.
//

import Foundation
import UIKit

// MARK: Router

enum MainViewRoutes {
    case list(Media)
}

protocol MainViewRouterProtocol {
    func navigate(_ route: MainViewRoutes)
}

final class MainViewRouter {
    
    var view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
}

extension MainViewRouter: MainViewRouterProtocol {
    func navigate(_ route: MainViewRoutes) {
        switch route {
        case .list(let searchModel):
            let listView = MainDetailBuilder.make(media: searchModel)
            view.show(listView, sender: nil)
        }
    }
}
