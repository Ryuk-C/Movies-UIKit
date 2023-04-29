//
//  MovieService.swift
//  MovieDB
//
//  Created by Cuma Haznedar on 29/04/2023.
//

import Foundation

final class MovieService {
    
    func downloadMovies(page: Int, completion: @escaping ([MovieResult]?) -> ()) {
        guard let url = URL(string: APIURLs.movies(page: page)) else { return }
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                completion(self.handleWithData(data))
            case .failure(let error):
                print(error)
                self.handleWithError(error)
            }
        }
    }
    
    func handleWithError(_ error: Error) {
        print(error.localizedDescription)
    }
    
    private func handleWithData(_ data: Data) -> [MovieResult]? {
        do {
            let movie = try JSONDecoder().decode(Movie.self, from: data)
            return movie.results
        } catch {
            print(error)
            return nil
        }
    }
    
    
}
