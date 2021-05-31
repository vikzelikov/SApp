//
//  Movie.swift
//  SApp
//
//  Created by Yegor on 31.05.2021.
//

import Foundation

struct Movie: Equatable, Identifiable {
    typealias Identifier = String
    enum Genre {
        case adventure
        case scienceFiction
    }
    let id: Identifier
    let title: String?
    let genre: Genre?
    let movieImagePath: String?
    let overview: String?
    let date: Date?
}

struct MoviesPage: Equatable {
    let page: Int
    let totalPages: Int
    let movies: [Movie]
}
