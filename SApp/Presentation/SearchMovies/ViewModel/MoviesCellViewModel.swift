//
//  SearchMoviesCellViewModel.swift
//  SApp
//
//  Created by Yegor on 31.05.2021.
//

import Foundation

struct MoviesCellViewModel {
    let title: String
    let overview: String
    let date: String
    let movieImageUrl: String?
}

extension MoviesCellViewModel {
    init(movie: Movie) {
        self.title = movie.title ?? ""
        self.movieImageUrl = movie.movieImageUrl
        self.overview = movie.overview ?? ""
        self.date = movie.date ?? ""
    }
}
