import UIKit

//  Created by naeem alabboodi on 6/17/21.
//  API Key (v3 auth) = 0a24180041f6b1f51f7bc4d911edf177
// Example API Request =  https://api.themoviedb.org/3/movie/550?api_key=0a24180041f6b1f51f7bc4d911edf177
// API Read Access Token (v4 auth) = eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYTI0MTgwMDQxZjZiMWY1MWY3YmM0ZDkxMWVkZjE3NyIsInN1YiI6IjYwY2JkYWRkNmU5MzhhMDA2ZGM4YjhjOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.S7bN3hQz_cj2K4r-1NnffmlAra3vo1vfZ375aEopeOw

//GET /movie/now_playing
// (https://api.themoviedb.org/3/movie/now_playing?api_key=<<api_key>>&language=en-US&page=1)


let urlapIKey = "https://api.themoviedb.org/3/movie/550?api_key=0a24180041f6b1f51f7bc4d911edf177"
let listOfMovieRightNow = "https://api.themoviedb.org/3/movie/now_playing?api_key=0a24180041f6b1f51f7bc4d911edf177&language=en-US&page=3"
let API_Key = "0a24180041f6b1f51f7bc4d911edf177"
let baseURL = "https://api.themoviedb.org/3/"
let listMovies = "https://api.themoviedb.org/3/search/movie?api_key=0a24180041f6b1f51f7bc4d911edf1777&query=<keyword>"
let configDataLikeImage = baseURL + "configuration?api_key=0a24180041f6b1f51f7bc4d911edf177"

let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=0a24180041f6b1f51f7bc4d911edf177&language=en-US&page=1"
func fetchData(url: String ){
    if let url = URL(string: url){
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil{ print(error)}
            if let safdata = data {
                let   result = String(data: safdata, encoding: .utf8)
                print(result!)
            }
        }
        task.resume()
    }

}
fetchData(url: urlString)
