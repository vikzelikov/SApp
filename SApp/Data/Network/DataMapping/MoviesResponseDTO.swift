//
//  MoviesResponseDTO.swift
//  SApp
//
//  Created by Yegor on 03.06.2021.
//

import Foundation

struct MoviesResponseDTO: Decodable {
    private enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case movies = "results"
    }
    let page: Int
    let totalPages: Int
    let movies: [MovieDTO]

    struct MovieDTO: Decodable {
        private enum CodingKeys: String, CodingKey {
            case id
            case title
            case movieImageUrl = "poster_path"
            case overview
            case releaseDate = "release_date"
        }
        let id: Int
        let title: String?
        let movieImageUrl: String?
        let overview: String?
        let releaseDate: String?
    }
}
