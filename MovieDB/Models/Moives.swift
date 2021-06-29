//
//  Moives.swift
//  MovieDB
//
//  Created by naeem alabboodi on 6/24/21.
//

import UIKit

struct Movies: Codable ,Hashable{
    let page:Int
    let results : [movieDetails]
    let totalPages:Int
    
}


struct movieDetails: Codable ,Hashable{
    let id: Int
    let title:String
    let posterPath:String
    
}

