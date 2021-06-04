//
//  SearchMoviesUseCase.swift
//  SApp
//
//  Created by Yegor on 03.06.2021.
//

import Foundation

protocol SearchMoviesUseCase {
    func execute(query: MovieQuery, completion: @escaping (Result<MoviesPage, Error>) -> Void)
}

class SearchMoviesUseCaseImpl: SearchMoviesUseCase {
    
    private let moviesRepository: MoviesRepository?
    
    init() {
        self.moviesRepository = MoviesRepositoryImpl()
    }
    
    func execute(query: MovieQuery, completion: @escaping (Result<MoviesPage, Error>) -> Void) {

            moviesRepository?.fetchMoviesList(query: query, completion: { result in
                do {
                    let responseMoviesDTO = try result.get()
                    
                    //convertion from DTO
                    let movies = responseMoviesDTO.movies.map {
                        Movie(id: String($0.id), title: $0.title, movieImageUrl: $0.movieImageUrl, overview: $0.overview, date: $0.releaseDate)
                    }
                    let moviesPage = MoviesPage(page: responseMoviesDTO.page, totalPages: responseMoviesDTO.totalPages, movies: movies)
                    completion(.success(moviesPage))
                    
                    if case .success = result {
                        //save query.query string in recent
                    }
                } catch {
                    
                }
        })
    }
}
