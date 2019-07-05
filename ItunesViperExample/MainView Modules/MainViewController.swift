//
//  ViewController.swift
//  ItunesViperExample
//
//  Created by Kemal Serkan YILDIRIM on 5.07.2019.
//  Copyright © 2019 Kemal Serkan YILDIRIM. All rights reserved.
//

import UIKit


protocol MainViewProtocol : class {
    
    func handleOutput(_ output: MainViewPresenterOutput)
    
}


class MainViewController : UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var presenter: MainViewPresenter!
    var medias: Search?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        presenter.load()
    }


}

extension MainViewController : MainViewProtocol {
    
    func handleOutput(_ output:  MainViewPresenterOutput) {
        switch output {
        case .setLoading(let isLoading):
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        case .getMediaList(let searchResults):
            self.medias = searchResults
            tableView.reloadData()
        }
    }
}

extension MainViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medias?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainTableViewCell", for: indexPath) as! MainTableViewCell
        cell.configure(with: (medias?.results[indexPath.row])!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        presenter.selecttrack(at: indexPath.row)
    }
}
