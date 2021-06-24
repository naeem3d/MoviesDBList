//
//  AllMovieCollectionViewController.swift
//  MovieDB
//
//  Created by naeem alabboodi on 6/17/21.
//

import UIKit

class AllMovieCollectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .systemGreen
        
   
        
        NetworkManager.share.getMovies(page: 1) { movies, error in
            guard let movies = movies else { print(error) ; return }
            
            print("movieList.count = \(movies.count)")
            
            
            
        }
        
    }
    

   

}
