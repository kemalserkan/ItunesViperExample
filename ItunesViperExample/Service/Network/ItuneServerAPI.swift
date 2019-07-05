//
//  ItuneServerAPI.swift
//  ItunesViperExample
//
//  Created by Kemal Serkan YILDIRIM on 5.07.2019.
//  Copyright © 2019 Kemal Serkan YILDIRIM. All rights reserved.
//

import Foundation
import UIKit
import Moya

let ApiProvider = MoyaProvider<ItunesServerAPI>(endpointClosure: endpointClosure,plugins: [NetworkLoggerPlugin(verbose: true)])

var ApiBaseURL : String {
    get {
//        #if DEVELOPMENT
        return "https://itunes.apple.com/search?parameterkeyvalue&term=all&limit=50"
//        #else
//        return "https://itunes.apple.com/search?parameterkeyvalue&term=all&limit=50"
//        #endif
    }
}

enum ItunesServerAPI {
    case searchList
}

extension ItunesServerAPI: TargetType {
    
    public var baseURL: URL { return URL(string: ApiBaseURL)! }
    
    var path: String {
        switch self {
        case .searchList:
            return ""
        }
        
    }
    
    public var method: Moya.Method {
        switch self {
        case .searchList:
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        case .searchList:
            return .requestPlain
        }
    }
    
    public var sampleData: Data
    {
        switch self {
        default :
            return "[]".data(using: .utf8)!
        }
    }
    
    public var headers: [String : String]? {
        var header = [String:String]()
        switch self {
        case .searchList :
            header["Content-Type"] = "application/json"
            return header
        }
    }
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

let endpointClosure = { (target: ItunesServerAPI) -> Endpoint in
    
    var url  = target.baseURL.appendingPathComponent(target.path).absoluteString
    //return Endpoint(URL: url(target), sampleResponse: .Success(200, {target.sampleData}), method: target.method, parameters: target.parameters, parameterEncoding: target.parameterEncoding)
    
    let endpoint: Endpoint = Endpoint(url: url,
                                      sampleResponseClosure: {.networkResponse(200, target.sampleData)},
                                      method: target.method,
                                      task: target.task,
                                      httpHeaderFields: target.headers )
    
    return endpoint
}
