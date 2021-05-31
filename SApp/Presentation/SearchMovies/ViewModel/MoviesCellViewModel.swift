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
    let movieImagePath: String?
}

extension MoviesCellViewModel {
    init(movie: Movie) {
        self.title = movie.title ?? ""
        self.movieImagePath = movie.movieImagePath
        self.overview = movie.overview ?? ""
        if let date = movie.date {
            self.date = "\(NSLocalizedString("Release Date", comment: "")): \(dateFormatter.string(from: date))"
        } else {
            self.date = NSLocalizedString("To be announced", comment: "")
        }
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()
