//
//  MovieController.swift
//  MovieFetch
//
//  Created by iMac Pro on 2/23/23.
//

import UIKit

class MovieController {
    
    static func fetchMovieWith(searchTerm: String, completion: @escaping ([Movie]?) -> Void) {
        guard let movieBaseURL    = URL(string: Constants.MovieURLs.movieBaseURL) else { completion(nil) ; return }
        var urlComponents         = URLComponents(url: movieBaseURL, resolvingAgainstBaseURL: true)
        
        let apiQuery              = URLQueryItem(name: Constants.MovieURLs.apiKeyKey, value: Constants.MovieURLs.apiKeyValue)
        let movieQuery            = URLQueryItem(name: Constants.MovieURLs.movieQueryKey, value: searchTerm)
        let adultFilterQuery      = URLQueryItem(name: Constants.MovieURLs.adultFilterKey, value: Constants.MovieURLs.adultFilterValue)
        urlComponents?.queryItems = [apiQuery, movieQuery, adultFilterQuery]
        
        guard let finalURL = urlComponents?.url else { completion(nil) ; return }
        print("Final Movie List URL: \(finalURL)")
        
        URLSession.shared.dataTask(with: finalURL) { movieData, response, error in
            if let error = error {
                print("Error in Movie List request: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Movie List request Response Code: \(response.statusCode)")
            }
            
            guard let data = movieData else { completion(nil) ; return }
            do {
                let topLevel = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String : Any]
                guard let movieListArray = topLevel?["results"] as? [[String : Any]] else { completion(nil) ; return }
                    
                let movies = movieListArray.compactMap { Movie(dictionary: $0) }
                completion(movies)
            } catch {
                print("Unable to retreive Movie List data: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
    
    static func fetchPoster(forMovie movie: Movie, completion: @escaping (UIImage?) -> Void) {
        guard let posterBaseURL = URL(string: Constants.PosterURLs.posterBaseURL) else { completion(nil) ; return }
        var urlComponents = URLComponents(url: posterBaseURL, resolvingAgainstBaseURL: true)
        urlComponents?.path.append(movie.posterPath)
        
        guard let finalPosterURL = urlComponents?.url else { completion(nil) ; return }
        print("Final Poster URL: \(finalPosterURL)")
        
        URLSession.shared.dataTask(with: finalPosterURL) { posterData, response, error in
            if let error = error {
                print("Error is Poster request: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Poster Image Status Code: \(response.statusCode)")
            }
            
            guard let data = posterData else { completion(nil) ; return }
            let poster = UIImage(data: data)
            completion(poster)
        }.resume()
    }
}
