//
//  DetailViewController.swift
//  MovieDB
//
//  Created by Cuma Haznedar on 29/04/2023.
//

import Foundation

protocol DetailViewModelProtocol {
    var view: DetailScreenInterface? {get set}
    
    func viewDidLoad()
    
    
}

final class DetailViewModel {
    
    weak var view : DetailScreenInterface?
    
    
}

extension DetailViewModel: DetailViewModelProtocol {
    
    func viewDidLoad() {
        
        view?.configureVC()
        view?.configurePosyerImageView()
        view?.downloadPosterImage()
        view?.configureTitleLabel()
        view?.configureDateLabel()
        view?.configureOverviewLabel()
        
    }
    
}
