//
//  MovieListTableViewCell.swift
//  MovieFetch
//
//  Created by iMac Pro on 2/23/23.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
    
    //MARK: - PROPERTIES
    
    
    
    //MARK: - FUNCITONS
    func setConfiguration(with movie: Movie) {
        var config = defaultContentConfiguration()
        config.text                                  = movie.title
        config.secondaryText                         = movie.overview
        config.secondaryTextProperties.numberOfLines = 4
        contentConfiguration                         = config
    }
}
