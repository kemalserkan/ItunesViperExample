//
//  BaseNavigation.swift
//  ItunesViperExample
//
//  Created by Kemal Serkan YILDIRIM on 5.07.2019.
//  Copyright © 2019 Kemal Serkan YILDIRIM. All rights reserved.
//

import UIKit

class BaseNavigation: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
    }
    
    private func setupNavigation() {
        navigationBar.barTintColor = UIColor(red: 242/255, green: 197/255, blue: 0, alpha: 1)
        navigationBar.tintColor = .black
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationBar.titleTextAttributes = textAttributes
    }
}
