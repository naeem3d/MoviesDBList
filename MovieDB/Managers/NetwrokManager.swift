//
//  NetwrokManager.swift
//  MovieDB
//
//  Created by naeem alabboodi on 6/24/21.
//

import UIKit

class NetworkManager {
    
    static  let share = NetworkManager()
   private let baseURL = "https://api.themoviedb.org/3/"
    let cashe = NSCache<NSString,UIImage>()
    
    // we will create private init to just be call her
    private init(){}
    
    func getMovies(page: Int , Completion: @escaping (Result<[movieDetails],ErrorMessage>) -> Void){
        
        let endPoint = baseURL + "movie/popular?api_key=0a24180041f6b1f51f7bc4d911edf177&language=en-US&page=\(page)"
        
        guard let url = URL(string: endPoint) else {Completion(.failure(.invalideUserName)); return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error { Completion(.failure(.invalidResponse)) ; return    }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                Completion(.failure(.unabletocomplte))
                return
            }
            
            guard let data = data else { Completion(.failure(.unabletocomplte)); return }
            
            do {
               let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let movies = try decoder.decode(Movies.self, from: data)
                let results = movies.results
                print(results)
                Completion(.success(results))
            }catch {
                Completion(.failure(.invalidData))
                return 
            }
            
            
            
        }
        task.resume()
        
        
        
    }
}
