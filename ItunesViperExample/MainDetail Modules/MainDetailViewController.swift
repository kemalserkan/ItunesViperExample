//
//  MainDetailViewController.swift
//  ItunesViperExample
//
//  Created by Kemal Serkan YILDIRIM on 5.07.2019.
//  Copyright © 2019 Kemal Serkan YILDIRIM. All rights reserved.
//

import UIKit

class MainDetailViewController: UIViewController, MainDetailViewProtocol {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailSubtitle: UILabel!
    
    var presenter: MainDetailPresenter!
    var result: Media!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
    }
    
    func update(_ presentation: Media) {
        detailImageView.kf.setImage(with: URL(string: presentation.artworkUrl100 ?? ""))
        detailTitle.text = presentation.artistName
        detailSubtitle.text = presentation.trackName
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
