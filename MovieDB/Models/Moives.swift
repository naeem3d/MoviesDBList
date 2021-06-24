//
//  Moives.swift
//  MovieDB
//
//  Created by naeem alabboodi on 6/24/21.
//

import UIKit

struct Movies: Codable {
    let page:Int
    let results : [movieDetails]
    let totalPages:Int
    
}


struct movieDetails: Codable {
    let id: Int
    
}

