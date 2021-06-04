//
//  MoviesRepository.swift
//  SApp
//
//  Created by Yegor on 03.06.2021.
//

import Foundation
import Alamofire

protocol MoviesRepository {
    func fetchMoviesList(query: MovieQuery, completion: @escaping (Result<MoviesResponseDTO, Error>) -> Void)
}

class MoviesRepositoryImpl: MoviesRepository {
    
    func fetchMoviesList(query: MovieQuery, completion: @escaping (Result<MoviesResponseDTO, Error>) -> Void) {
        
        guard let url = NetworkHelper.getUrlSearchMovies() else {
            completion(.failure(NetworkError.cancelled))
            return
        }
        let parameters = MoviesRequestDTO(query: query.query, page: String(query.page)).parameters
        let headers: HTTPHeaders = NetworkHelper.getHeaders()

        AF.request(url, method: .get, parameters: parameters, headers: headers).responseString { response in
            
            guard let data = response.data else {
                completion(.failure(NetworkError.errorData))
                return
            }
            
            guard let response = response.response else {
                completion(.failure(NetworkError.errorData))
                return
            }
            
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
    

