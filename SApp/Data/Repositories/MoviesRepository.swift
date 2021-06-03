//
//  MoviesRepository.swift
//  SApp
//
//  Created by Yegor on 03.06.2021.
//

import Foundation
import Alamofire

protocol MoviesRepository {
    func fetchMoviesList(query: MovieQuery, page: Int,
                         completion: @escaping (Result<MoviesPage, Error>) -> Void)
}

class MoviesRepositoryImpl: MoviesRepository {
    
    func fetchMoviesList(query: MovieQuery,
                         page: Int,
                         completion: @escaping (Result<MoviesPage, Error>) -> Void) {
        
//        let request = MoviesRequestDTO(query: query.query, page: page)
        
        guard let url = URL(string: Constant.BASE_URL + "/3/search/movie") else { return }
        
        let parameters = ["api_key": Constant.API_KEY, "query": query.query]
        
        let headers: HTTPHeaders = [
//                   .authorization(username: "test@email.com", password: "testpassword"),
                   .accept("application/json")
               ]

        AF.request(url, method: .get, parameters: parameters, headers: headers).responseString { response in
            
            guard let data = response.data else { return }
            guard let response = response.response else { return }
            
            if response.statusCode != 200 {
                print(response.statusCode)
                print(response)
                return
            }
            
            let response1 = try? JSONDecoder().decode(MoviesResponseDTO.self, from: data)
            print(response1?.movies.first?.title)
            
        }
    }
        
        
}
    

