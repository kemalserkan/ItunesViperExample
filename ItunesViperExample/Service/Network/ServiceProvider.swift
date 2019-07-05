//
//  ServiceProvider.swift
//  ItunesViperExample
//
//  Created by Kemal Serkan YILDIRIM on 5.07.2019.
//  Copyright © 2019 Kemal Serkan YILDIRIM. All rights reserved.
//

import Foundation
import ObjectMapper

class ServiceProvider: NSObject {
    
    static func getSongList(onSuccess success: @escaping (_ songList : Search) -> Void, onFailure failure: @escaping (_ error: Error?) -> Void) {
        
        ApiProvider.request(.searchList, completion:  { result in
            
            var tracks: Search!
            
            switch result {
                
                case let .success(moyaResponse):
                    let data = moyaResponse.data
                    
                    do {
                        let results = try JSONDecoder().decode(Search.self, from: data)
                        tracks = results
                        success(tracks)
                    } catch let error {
                        failure(error)
                    }
                    
                break
                case let .failure(error):
                    failure(error)
                break
            }
        })
        
    }
}
