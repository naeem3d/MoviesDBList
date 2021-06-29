//
//  labelMD.swift
//  MovieDB
//
//  Created by naeem alabboodi on 6/24/21.
//

import UIKit

class labelMD: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlingment:NSTextAlignment, sizeFont:CGFloat){
        super.init(frame: .zero)
        self.textAlignment = textAlingment
        self.font = UIFont.systemFont(ofSize: sizeFont, weight: .medium)
        configure()
    }
    
    
    
    private func configure(){
        textColor = .systemPink
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.8
        lineBreakMode = .byTruncatingTail
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    


}
