//
//  Constants.swift
//  MovieFetch
//
//  Created by iMac Pro on 2/23/23.
//

import Foundation

struct Constants {

//https://api.themoviedb.org/3/search/movie?api_key=18f6f43a0df939c87e2ea552d34b5550&query=batman&include_adult=false
    struct MovieURLs {
        static let movieBaseURL      = "https://api.themoviedb.org/3/search/movie"
        
        static let apiKeyKey         = "api_key"
        static let apiKeyValue       = "18f6f43a0df939c87e2ea552d34b5550"
        
        static let movieQueryKey     = "query"
        
        static let adultFilterKey    = "include_adult"
        static let adultFilterValue  = "false"
    }
    
    struct PosterURLs {
        static let posterBaseURL     = "https://image.tmdb.org/t/p/w500"
    }
    
}
