//
//  DetailScreen.swift
//  MovieDB
//
//  Created by Cuma Haznedar on 29/04/2023.
//

import UIKit


protocol DetailScreenInterface: AnyObject {
    
    func configureVC()
    
}

class DetailScreen: UIViewController {

    private let movie: MovieResult
    var viewModel = DetailViewModel()

    init(movie: MovieResult) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

}

extension DetailScreen: DetailScreenInterface {
    
    func configureVC() {
        view.backgroundColor = .white
    }
    
    
    
    
}
