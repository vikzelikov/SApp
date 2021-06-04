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
    private var currentPage: Int = 0
    private var totalPageCount: Int = 1
    var items: [MoviesCellViewModel] = []
//    var items: Observable<[MoviesCellViewModel]> = Observable([])
    
    init() {
        self.searchMoviesUseCase = SearchMoviesUseCaseImpl()
    }

    func search(query: String) {
        resetPages()
        
        guard !query.isEmpty else { return }
        
        let movieQuery = MovieQuery(query: query, page: currentPage)
        getMovies(query:movieQuery)
    }
    
    func cancelSearch() {
        
    }
    
    private func getMovies(query: MovieQuery) {
        searchMoviesUseCase?.execute(query: query, completion: { result in
            
        })
    }
    
    private func appendMovies(page: MoviesPage) {
        //append and show
    }
    
    private func resetPages() {
        currentPage = 0
        totalPageCount = 1
//        pages.removeAll()
//        items.value.removeAll()
    }

    
}
