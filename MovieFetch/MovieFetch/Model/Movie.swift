//
//  Movie.swift
//  MovieFetch
//
//  Created by iMac Pro on 2/23/23.
//

import Foundation

class Movie {
    let title: String
    let overview: String
    let posterPath: String
    let rating: Double
    
    init(title: String, overview: String, posterPath: String, rating: Double) {
        self.title      = title
        self.overview   = overview
        self.posterPath = posterPath
        self.rating     = rating
    }
}


extension Movie {
    
    enum Keys: String {
        case title
        case overview
        case posterPath = "poster_path"
        case rating     = "vote_average"
    }
    
    convenience init?(dictionary: [String : Any]) {
        guard let title      = dictionary[Keys.title.rawValue] as? String,
              let overview   = dictionary[Keys.overview.rawValue] as? String,
              let posterPath = dictionary[Keys.posterPath.rawValue] as? String,
              let rating     = dictionary[Keys.rating.rawValue] as? Double else { return nil }
        
        self.init(title: title, overview: overview, posterPath: posterPath, rating: rating)
    }
}
