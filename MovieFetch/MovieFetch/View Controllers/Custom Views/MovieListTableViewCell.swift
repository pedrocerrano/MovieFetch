//
//  MovieListTableViewCell.swift
//  MovieFetch
//
//  Created by iMac Pro on 2/23/23.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
    
    //MARK: - OUTLETS
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    
    
    //MARK: - FUNCITONS
    func updateUI(movie: Movie) {
        movieTitleLabel.text = movie.title
        movieRatingLabel.text = "Rating: \(movie.rating)/10"
        movieOverviewLabel.text = movie.overview
        fetchPoster(forMovie: movie)
    }
    
    
    func fetchPoster(forMovie movie: Movie) {
        MovieController.fetchPoster(forMovie: movie) { poster in
            DispatchQueue.main.async {
                self.moviePosterImageView.image = poster
            }
        }
    }
}
