//
//  DetailScreen.swift
//  MovieDB
//
//  Created by Cuma Haznedar on 29/04/2023.
//

import UIKit

protocol DetailScreenInterface: AnyObject {

    func configureVC()
    func configurePosyerImageView()
    func downloadPosterImage()
    func configureTitleLabel()
    func configureDateLabel()
    func configureOverviewLabel()

}

class DetailScreen: UIViewController {

    private let movie: MovieResult
    var viewModel = DetailViewModel()

    private var posterImageView: PosterImageView!
    private let padding: CGFloat = 16
    private var titleLabel: UILabel!
    private var dateLabel: UILabel!
    private var overviewLabel: UILabel!

    init(movie: MovieResult) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
        print("DetailScreen Init")
    }
    
    deinit {
        print("DetailScreen Deinit")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()


    }

}

extension DetailScreen: DetailScreenInterface {

    func configureVC() {
        view.backgroundColor = .white
    }

    func configurePosyerImageView() {

        posterImageView = PosterImageView(frame: .zero)
        view.addSubview(posterImageView)

        posterImageView.layer.cornerRadius = 16
        posterImageView.clipsToBounds = true

        let posterWidth = CGFloat.dWidth * 0.4

        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            posterImageView.widthAnchor.constraint(equalToConstant: posterWidth),
            posterImageView.heightAnchor.constraint(equalToConstant: posterWidth * 1.5)
            ])

    }

    func downloadPosterImage() {
        posterImageView.downloadImage(movie: movie)
    }

    func configureTitleLabel() {
        titleLabel = UILabel(frame: .zero)
        view.addSubview(titleLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.text = movie.title
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.numberOfLines = 2

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: posterImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])

    }

    func configureDateLabel() {
        dateLabel = UILabel(frame: .zero)
        view.addSubview(dateLabel)

        dateLabel.translatesAutoresizingMaskIntoConstraints = false

        dateLabel.text = movie.releaseDate
        dateLabel.font = .systemFont(ofSize: 18)
        dateLabel.textColor = .secondaryLabel

        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
            ])
    }

    func configureOverviewLabel() {
        overviewLabel = UILabel(frame: .zero)
        view.addSubview(overviewLabel)

        overviewLabel.translatesAutoresizingMaskIntoConstraints = false

        overviewLabel.text = movie.overview
        overviewLabel.font = .systemFont(ofSize: 20)
        overviewLabel.numberOfLines = 0

        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 2 * padding),
            overviewLabel.leadingAnchor.constraint(equalTo: posterImageView.leadingAnchor),
            overviewLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
            ])

    }


}
