//
//  MovieListVC.swift
//  MovieFetch
//
//  Created by iMac Pro on 2/23/23.
//

import UIKit

class MovieListVC: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var movieListTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        movieListTableView.dataSource = self
        searchBar.delegate            = self
    }

    
    //MARK: - PROPERTIES
    var movies: [Movie] = []

    
    //MARK: - FUNCTIONS
    
    
}


//MARK: - EXT: TableViewDataSource
extension MovieListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieListTableViewCell else { return UITableViewCell() }
        
        let movie = movies[indexPath.row]
        cell.updateUI(movie: movie)
        
        return cell
    }
}


//MARK: - EXT: SearchBar
extension MovieListVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        MovieController.fetchMovieWith(searchTerm: searchTerm) { movies in
            guard let movies = movies else { return }
            self.movies = movies
            
            DispatchQueue.main.async {
                self.movieListTableView.reloadData()
            }
        }
    }
    
}
