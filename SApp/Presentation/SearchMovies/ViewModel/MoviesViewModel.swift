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
    
    var items: [MoviesCellViewModel] = []
//    var items: Observable<[MoviesCellViewModel]> = Observable([])

    func search(query: String) {
        guard !query.isEmpty else { return }
        getMovies(query: MovieQuery(query: query))
    }
    
    func cancelSearch() {
        
    }
    
    private func getMovies(query: MovieQuery) {
        //go to use cases
         let movies = [
            MoviesCellViewModel(title: "Brigada", overview: "some overview some overview overview some vor", date: "12:12", movieImagePath: nil),
            MoviesCellViewModel(title: "Brigada1", overview: "some overview some overview overview some vor", date: "12:12", movieImagePath: nil),
            MoviesCellViewModel(title: "Brigada2", overview: "some overview some overview overview some vor", date: "12:12", movieImagePath: nil),
            MoviesCellViewModel(title: "Brigada3", overview: "some overview some overview overview some vor", date: "12:12", movieImagePath: nil),
            MoviesCellViewModel(title: "Brigada4", overview: "some overview some overview overview some vor", date: "12:12", movieImagePath: nil),
            MoviesCellViewModel(title: "Brigada5", overview: "some overview some overview overview some vor", date: "12:12", movieImagePath: nil),
            MoviesCellViewModel(title: "Brigada6", overview: "some overview some overview overview some vor", date: "12:12", movieImagePath: nil),
            
        ]
        
        for el in movies {
            items.append(el)
        }
    }
    
    private func appendMovies(page: MoviesPage) {
        //append and show
    }
    
    
    
}
