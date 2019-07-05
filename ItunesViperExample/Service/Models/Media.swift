//
//  Media.swift
//  ItunesViperExample
//
//  Created by Kemal Serkan YILDIRIM on 5.07.2019.
//  Copyright © 2019 Kemal Serkan YILDIRIM. All rights reserved.
//

import Foundation

struct Media: Equatable {
    let wrapperType : String?
    let kind : String?
    let trackId : Int?
    let artistName : String?
    let trackName : String?
    let artworkUrl100: String?
}

extension Media : Decodable {
    
    enum MediaCodingKeys : String, CodingKey{
        case wrapperType = "wrapperType"
        case kind = "kind"
        case trackId = "trackId"
        case artistName = "artistName"
        case trackName = "trackName"
        case artworkUrl100 = "artworkUrl100"
    }
    
    init(from decoder : Decoder) throws {
        let container = try decoder.container(keyedBy: MediaCodingKeys.self)
        
        wrapperType = try? container.decode(String.self, forKey: .wrapperType)
        kind = try? container.decode(String.self, forKey: .kind)
        trackId = try? container.decode(Int.self, forKey: .trackId)
        artistName = try? container.decode(String.self, forKey: .artistName)
        trackName = try? container.decode(String.self, forKey: .trackName)
        artworkUrl100 = try? container.decode(String.self, forKey: .artworkUrl100)
        
        
    }
}
