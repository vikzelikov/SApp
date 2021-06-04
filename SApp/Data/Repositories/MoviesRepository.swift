//
//  MoviesRepository.swift
//  SApp
//
//  Created by Yegor on 03.06.2021.
//

import Foundation
import Alamofire

protocol MoviesRepository {
    func fetchMoviesList(query: MovieQuery, page: Int, completion: @escaping (Result<MoviesResponseDTO, Error>) -> Void)
}

class MoviesRepositoryImpl: MoviesRepository {
    
    func fetchMoviesList(query: MovieQuery,
                         page: Int,
                         completion: @escaping (Result<MoviesResponseDTO, Error>) -> Void) {
        
        guard let url = NetworkService.getUrlSearchMovies() else {
            completion(.failure(NetworkError.cancelled))
            return
        }
        let requestParameters = MoviesRequestDTO(query: query.query).parameters
        let headers: HTTPHeaders = NetworkService.getHeaders()

        AF.request(url, method: .get, parameters: requestParameters, headers: headers).responseString { response in
            
            guard let data = response.data else { return }
            guard let response = response.response else { return }
            
            if response.statusCode != 200 {
                completion(.failure(NetworkError.errorCode(statusCode: response.statusCode)))
                return
            }
            
            if let responseDTO = try? JSONDecoder().decode(MoviesResponseDTO.self, from: data) {
                completion(.success(responseDTO))
            } else {
                completion(.failure(NetworkError.errorData))
            }
        }
    }
        
}
    

