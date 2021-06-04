//
//  NetworkService.swift
//  SApp
//
//  Created by Yegor on 04.06.2021.
//

import Foundation
import Alamofire

public enum NetworkError: Error {
    case errorCode(statusCode: Int)
    case notConnected
    case cancelled
    case errorData
}


struct NetworkService {
    static func getHeaders() -> HTTPHeaders {
        return [.contentType("application/json;charset=utf-8")]
    }
    
    static func getUrlSearchMovies() -> URL? {
        return URL(string: Constant.BASE_URL + "/3/search/movie")
    }
}
