//
//  SearchMoviesViewModel.swift
//  SApp
//
//  Created by Yegor on 31.05.2021.
//

import Foundation

protocol MoviesViewModelOutput {
    var items: Observable<[MoviesCellViewModel]> { get }
}

class MoviesViewModel: MoviesViewModelOutput {
    var items: Observable<[MoviesCellViewModel]> = Observable([])
    
    
}
