//
//  SearchMoviesViewModel.swift
//  SApp
//
//  Created by Yegor on 31.05.2021.
//

import Foundation

protocol MoviesViewModelLogic {
    var items: [MoviesCellViewModel] { get }
//    var items: Observable<[MoviesCellViewModel]> { get }
    
    func search(query: String)
    func cancelSearch()
}

class MoviesViewModel: MoviesViewModelLogic {
    
    private let searchMoviesUseCase: SearchMoviesUseCase?
    
    var items: [MoviesCellViewModel] = []
//    var items: Observable<[MoviesCellViewModel]> = Observable([])
    
    init() {
        self.searchMoviesUseCase = SearchMoviesUseCaseImpl()
    }

    func search(query: String) {
        guard !query.isEmpty else { return }
        getMovies(query: MovieQuery(query: query))
    }
    
    func cancelSearch() {
        
    }
    
    private func getMovies(query: MovieQuery) {
        //go to use cases
//         let movies = [
//            MoviesCellViewModel(title: "Brigada", overview: "some overview some overview overview some vor", date: "12:12", movieImagePath: nil),
//            MoviesCellViewModel(title: "Brigada1", overview: "some overview some overview overview some vor", date: "12:12", movieImagePath: nil),
//            MoviesCellViewModel(title: "Brigada2", overview: "some overview some overview overview some vor", date: "12:12", movieImagePath: nil),
//            MoviesCellViewModel(title: "Brigada3", overview: "some overview some overview overview some vor", date: "12:12", movieImagePath: nil),
//            MoviesCellViewModel(title: "Brigada4", overview: "some overview some overview overview some vor", date: "12:12", movieImagePath: nil),
//            MoviesCellViewModel(title: "Brigada5", overview: "some overview some overview overview some vor", date: "12:12", movieImagePath: nil),
//            MoviesCellViewModel(title: "Brigada6", overview: "some overview some overview overview some vor", date: "12:12", movieImagePath: nil),
//
//        ]
//
//        for el in movies {
//            items.append(el)
//        }
        
        var request = SearchMoviesUseCaseRequest(query: MovieQuery(query: "Jack"), page: 0)
        
        searchMoviesUseCase?.execute(request: request, completion: { result in
            
        })
        
        print("1111")
        
    }
    
    private func appendMovies(page: MoviesPage) {
        //append and show
    }
    
    
    
}
