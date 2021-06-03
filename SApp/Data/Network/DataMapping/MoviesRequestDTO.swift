//
//  MoviesRequestDTO.swift
//  SApp
//
//  Created by Yegor on 03.06.2021.
//

import Foundation

struct MoviesRequestDTO: Encodable {
    let query: String
    let page: Int
}
