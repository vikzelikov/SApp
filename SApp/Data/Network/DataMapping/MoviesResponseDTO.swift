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
            case genre
            case posterPath = "poster_path"
            case overview
            case releaseDate = "release_date"
        }
        enum GenreDTO: String, Decodable {
            case adventure
            case scienceFiction = "science_fiction"
        }
        let id: Int
        let title: String?
        let genre: GenreDTO?
        let posterPath: String?
        let overview: String?
        let releaseDate: String?
    }
    
   
    
    
    
}


struct testMovie: Decodable {
    let page: Int
    let total_pages: Int
    let movies: [MovieDTO]
    
    struct MovieDTO: Decodable {
        let id: Int
        let title: String?
        let poster_path: String?
        let overview: String?
        let release_date: String?
    }
}
