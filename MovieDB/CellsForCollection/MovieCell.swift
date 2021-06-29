//
//  MovieCell.swift
//  MovieDB
//
//  Created by naeem alabboodi on 6/24/21.
//

import UIKit

class MovieCell: UICollectionViewCell {
    static let reuseID = "cellMovies"
    let MoviePosterView = moviePosterImageView(frame: .zero)
    let movieTitle = labelMD(textAlingment: .center, sizeFont: 20)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        confgure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func confgure(){
        
        addSubview(MoviePosterView)
        addSubview(movieTitle)
        
        NSLayoutConstraint.activate([
            MoviePosterView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            MoviePosterView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            MoviePosterView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            MoviePosterView.heightAnchor.constraint(equalTo: MoviePosterView.widthAnchor),
            
            movieTitle.topAnchor.constraint(equalTo: MoviePosterView.bottomAnchor, constant: 15),
            movieTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            movieTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            movieTitle.heightAnchor.constraint(equalToConstant: 20)
        
            
        ])
        
    }
    
    
    
    
    
}
