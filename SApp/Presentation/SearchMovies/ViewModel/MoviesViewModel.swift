//
//  SearchMoviesViewModel.swift
//  SApp
//
//  Created by Yegor on 31.05.2021.
//

import Foundation

protocol MoviesViewModelLogic {
    var items: Observable<[MoviesCellViewModel]> { get }

    func search(query: String, completion: @escaping (Bool) -> Void)
    func getMoviesNextPage(completion: @escaping (Bool) -> Void)
    func cancelSearch()
    func didSelectItem(at index: Int)
}

class MoviesViewModel: MoviesViewModelLogic {
    
    private let searchMoviesUseCase: SearchMoviesUseCase?
    private var query: String = ""
    private var currentPage: Int = 1
    private var totalPageCount: Int = 1
    var items: Observable<[MoviesCellViewModel]> = Observable([])
    
    init() {
        self.searchMoviesUseCase = SearchMoviesUseCaseImpl()
    }

    func search(query: String, completion: @escaping (Bool) -> Void) {
        resetPages()
        
        guard !query.isEmpty else { return }
        
        let movieQuery = MovieQuery(query: query, page: currentPage)
        getMovies(query: movieQuery, completion: { result in completion(result) })
    }
    
    func cancelSearch() {
        
    }
    
    private func getMovies(query: MovieQuery, completion: @escaping (Bool) -> Void) {
        self.query = query.query
        
        searchMoviesUseCase?.execute(query: query, completion: { result in
            switch result {
            case .success(let page):
                self.appendMovies(page: page)
            case .failure(let error):
                print("ERROR \(error)")
            }
            
            completion(true)
        })
    }
    
    func getMoviesNextPage(completion: @escaping (Bool) -> Void) {
        if currentPage + 1 > totalPageCount { return }
        currentPage += 1
        
        let movieQuery = MovieQuery(query: self.query, page: currentPage)
        getMovies(query: movieQuery) { _ in }
    }
    
    private func appendMovies(page: MoviesPage) {
        currentPage = page.page
        totalPageCount = page.totalPages
            
        let movies = page.movies.map(MoviesCellViewModel.init)
        items.value += movies
    }
    
    private func resetPages() {
        currentPage = 1
        totalPageCount = 1
        items.value.removeAll()
    }
    
    func didSelectItem(at index: Int) {
        
    }

}
