//
//  HomeScreen.swift
//  MovieDB
//
//  Created by Cuma Haznedar on 28/04/2023.
//

import UIKit

protocol HomeScreenInterface: AnyObject {

    func configureVC()
    func configureCollectionView()
    func reloadCollectionView()
}

final class HomeScreen: UIViewController {

    let viewModel = HomeViewModel()
    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.view = self
        viewModel.viewDidLoad()

    }



}

extension HomeScreen: HomeScreenInterface {
    func configureVC() {

        view.backgroundColor = .systemGray
        title = "Popular Movies 🔥"

    }

    func configureCollectionView() {

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createHomeFlowLayout())

        view.addSubview(collectionView)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseID)

        collectionView.pinToEdgesOf(view: view)
        collectionView.backgroundColor = .systemYellow
    }


}

extension HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseID, for: indexPath) as! MovieCell

        cell.setCell(movie: viewModel.movies[indexPath.item])

        return cell

    }
    
    func reloadCollectionView() {
        
        collectionView.reloadOnMainThread()
        
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height

        if offsetY >= contentHeight - (2 * height) {
            viewModel.getMovies()
        }

    }


}
