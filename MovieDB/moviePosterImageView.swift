//
//  moviePosterImageView.swift
//  MovieDB
//
//  Created by naeem alabboodi on 6/24/21.
//

import UIKit

class moviePosterImageView: UIImageView {
    
 let placeHolderImage = UIImage(named: "avatar-placeholder")
    let cashe = NetworkManager.share.cashe
    override init(frame: CGRect) {
        super.init(frame: frame)
        configur()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    private func configur(){
        layer.cornerRadius = 12
        clipsToBounds = true
        image = placeHolderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
    func GetMovieImage(from urlString : String ) {
        let keyobject = NSString(string: urlString)
        if let image = cashe.object(forKey: keyobject){
            self.image = image
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
            guard let self = self else {return}
            if error != nil{ return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {return}
            guard let data = data else {return}
            guard let image = UIImage(data: data) else{return}
            
            self.cashe.setObject(image, forKey: keyobject)
            
            DispatchQueue.main.async {
                self.image = image
            }
       
        }
        task.resume()
      
    }
    
  
    
    
    
    
    
    
    
}
