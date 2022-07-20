//
//  SimilarCell.swift
//  Film
//
//  Created by Ahmet Bostancıklıoğlu on 19.07.2022.
//

import UIKit

class SimilarCell: UICollectionViewCell {
 
    static var reuseID = "similarCell"
    let image = MyImage(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(imagePath: String) {
        image.downloadImage(posterPath: imagePath)
    }
    
    private func configure() {
        addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate(
            [
                image.trailingAnchor.constraint(equalTo: trailingAnchor),
                image.leadingAnchor.constraint(equalTo: leadingAnchor),
                image.topAnchor.constraint(equalTo: topAnchor),
                image.bottomAnchor.constraint(equalTo: bottomAnchor)
            ]
        )
    }
    
}
