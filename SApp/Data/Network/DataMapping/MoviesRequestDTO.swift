//
//  MoviesRequestDTO.swift
//  SApp
//
//  Created by Yegor on 03.06.2021.
//

import Foundation

class MoviesRequestDTO {
    private var query: String
    private var page: String
    
    init(query: String, page: String) {
        self.query = query
        self.page = page
    }
    
    lazy var parameters = ["api_key": Constant.API_KEY, "query": query, "page": page]
}
