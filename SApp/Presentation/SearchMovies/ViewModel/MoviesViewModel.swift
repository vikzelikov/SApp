//
//  SearchMoviesViewModel.swift
//  SApp
//
//  Created by Yegor on 31.05.2021.
//

import Foundation

protocol MoviesViewModelLogic {
    var items: Observable<[MoviesCellViewModel]> { get }
    
    func search(query: String)
    func cancelSearch()
}

class MoviesViewModel: MoviesViewModelLogic {
    
    private let searchMoviesUseCase: SearchMoviesUseCase?
    private var currentPage: Int = 1
    private var totalPageCount: Int = 1
    var items: Observable<[MoviesCellViewModel]> = Observable([])
    
    init() {
        self.searchMoviesUseCase = SearchMoviesUseCaseImpl()
    }

    func search(query: String) {
        resetPages()
        
        guard !query.isEmpty else { return }
        
        let movieQuery = MovieQuery(query: query, page: currentPage)
        getMovies(query: movieQuery)
    }
    
    func cancelSearch() {
        
    }
    
    private func getMovies(query: MovieQuery) {
        searchMoviesUseCase?.execute(query: query, completion: { result in
            switch result {
            case .success(let page):
                self.appendMovies(page: page)
            case .failure(let error):
                print("ERROR \(error)")
            }
        })
    }
    
    private func appendMovies(page: MoviesPage) {
        currentPage = page.page
        totalPageCount = page.totalPages
        
        items.value = page.movies.map(MoviesCellViewModel.init)
    }
    
    private func resetPages() {
        currentPage = 1
        totalPageCount = 1
//        pages.removeAll()
        items.value.removeAll()
    }

    
}
