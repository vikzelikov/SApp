//
//  MoviesRequestDTO.swift
//  SApp
//
//  Created by Yegor on 03.06.2021.
//

import Foundation

class MoviesRequestDTO {
    private var query: String?
    
    init(query: String) {
        self.query = query
    }
    
    lazy var parameters = ["api_key": Constant.API_KEY, "query": query]
}
