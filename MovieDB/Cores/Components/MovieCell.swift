//
//  MovieCell.swift
//  MovieDB
//
//  Created by Cuma Haznedar on 29/04/2023.
//

import UIKit

final class MovieCell: UICollectionViewCell {
    
    static var reuseID = "MovieCell"
    private var posterImage : PosterImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
        setPosterImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        posterImage.image = nil
        posterImage.cancelDownloading()

    }
    
    private func configureCell() {
        backgroundColor = .systemGray5
        layer.cornerRadius = 16
        clipsToBounds = true
    }
    
    func setCell (movie: MovieResult){
        
        posterImage.downloadImage(movie: movie)
    }
    
    func setPosterImage(){
        
        posterImage = PosterImageView(frame: .zero)
        addSubview(posterImage)
                        
        posterImage.pinToEdgesOf(view: self)

    }
    
}
