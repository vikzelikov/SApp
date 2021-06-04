//
//  Movie.swift
//  SApp
//
//  Created by Yegor on 31.05.2021.
//

import Foundation

struct Movie: Equatable, Identifiable {
    let id: String
    let title: String?
    let movieImageUrl: String?
    let overview: String?
    let date: String?
}

struct MoviesPage: Equatable {
    let page: Int
    let totalPages: Int
    let movies: [Movie]
}
