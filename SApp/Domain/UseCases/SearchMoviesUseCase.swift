//
//  SearchMoviesUseCase.swift
//  SApp
//
//  Created by Yegor on 03.06.2021.
//

import Foundation

protocol SearchMoviesUseCase {
    func execute(request: SearchMoviesUseCaseRequest,
                 completion: @escaping (Result<MoviesPage, Error>) -> Void)
}

class SearchMoviesUseCaseImpl: SearchMoviesUseCase {
    
    private let moviesRepository: MoviesRepository?
    
    init() {
        self.moviesRepository = MoviesRepositoryImpl()
    }
    
    func execute(request: SearchMoviesUseCaseRequest,
                 completion: @escaping (Result<MoviesPage, Error>) -> Void) {

        
        
            moviesRepository?.fetchMoviesList(query: request.query, page: request.page, completion: { result in

                print("!!!!")
                do {
                    let x = try result.get().movies.first?.title
                    if x != nil {
                        print(x)
                    }
                } catch {
                    print("пиздец")
                }
                
                
            if case .success = result {
                //save query string in recent
            }

//            completion(result)
        })
    }
}

struct SearchMoviesUseCaseRequest {
    let query: MovieQuery
    let page: Int
}
