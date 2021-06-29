//
//  ErrorMess.swift
//  MovieDB
//
//  Created by naeem alabboodi on 6/24/21.
//

import Foundation
enum ErrorMessage:String,Error {
    case invalideUserName = "this invalide request"
    case unabletocomplte = "unable to complete request pls check internet "
    case invalidResponse  = "data recieve from server not valid "
    case invalidData = "unvalid data "
}
