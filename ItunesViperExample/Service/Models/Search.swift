//
//  Search.swift
//  ItunesViperExample
//
//  Created by Kemal Serkan YILDIRIM on 5.07.2019.
//  Copyright © 2019 Kemal Serkan YILDIRIM. All rights reserved.
//

import Foundation

struct Search {
    
    var results : [Media]
    let resultCount: Int
}

extension Search : Decodable {
    
    enum SearchCodingKeys : String, CodingKey{
        case results = "results"
        case resultCount = "resultCount"
    }
    
    init(from decoder : Decoder) throws {
        let container = try decoder.container(keyedBy: SearchCodingKeys.self)
        
        results = try container.decode([Media].self, forKey: .results)
        resultCount = try container.decode(Int.self, forKey: .resultCount)
    }
}
