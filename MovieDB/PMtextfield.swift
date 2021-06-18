//
//  PMtextfield.swift
//  MovieDB
//
//  Created by naeem alabboodi on 6/18/21.
//

import UIKit

class PMtextfield: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray2.cgColor
        
        textColor = .label // black in white board and white in black board
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        placeholder = "Enter words Hear "
        
    }
}
