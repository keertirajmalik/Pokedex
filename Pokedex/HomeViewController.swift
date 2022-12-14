//
//  ViewController.swift
//  Pokedex
//
//  Created by Keertiraj Laxman Malik on 11/10/22.
//

import UIKit

class HomeViewController: UIViewController {
    private var backgroundCardView: UIView!
    private var headerLabel: UILabel!
    private var searchTextField: UITextField!
    private var pokedexButtonView: UIView!
    private var movesButtonView: UIView!
    private var abilitiesButtonView: UIView!
    private var itemsButtonView: UIView!
    private var newsTableView: UITableView!
    private var newsViewAllLabel: UILabel!
    private var newsHeaderLabel: UILabel!

    private var lastContentOffset: CGFloat = 0.0
    private var backgroundViewTopConstraint: NSLayoutConstraint?
    private var oldContentOffset = CGPointZero
    private let topConstraintRange = (CGFloat(0) ..< CGFloat((UIScreen.main.bounds.height / 2) + 25))

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = Constants.backgroundColor

        backgroundCardViewSetup()
        backgroundPokeballImageView(uiView: backgroundCardView, frame: CGRect(x: UIScreen.main.bounds.width - 150, y: -75, width: 250, height: 250), tintColor: .gray)
        headerLabelView()
        searchTextFieldView()
        pokedexButtonViewSetup()
        movesButtonViewSetup()
        abilitiesButtonViewSetup()
        itemsButtonViewSetup()
        newsHeaderLabelView()
        newsViewAllLabelView()
        newsTableViewSetup()

        NSLayoutConstraint.activate([
            backgroundCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundCardView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.height / 2) + 25),

            headerLabel.topAnchor.constraint(equalTo: backgroundCardView.layoutMarginsGuide.topAnchor, constant: 75),
            headerLabel.leadingAnchor.constraint(equalTo: backgroundCardView.layoutMarginsGuide.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: backgroundCardView.layoutMarginsGuide.trailingAnchor),

            searchTextField.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            searchTextField.leadingAnchor.constraint(equalTo: backgroundCardView.layoutMarginsGuide.leadingAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: backgroundCardView.layoutMarginsGuide.trailingAnchor),
            searchTextField.heightAnchor.constraint(equalToConstant: 52),

            pokedexButtonView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            pokedexButtonView.leadingAnchor.constraint(equalTo: backgroundCardView.layoutMarginsGuide.leadingAnchor),
            pokedexButtonView.heightAnchor.constraint(equalToConstant: 52),
            pokedexButtonView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 20),

            movesButtonView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            movesButtonView.trailingAnchor.constraint(equalTo: backgroundCardView.layoutMarginsGuide.trailingAnchor),
            movesButtonView.heightAnchor.constraint(equalToConstant: 52),
            movesButtonView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 20),

            abilitiesButtonView.topAnchor.constraint(equalTo: pokedexButtonView.bottomAnchor, constant: 20),
            abilitiesButtonView.leadingAnchor.constraint(equalTo: backgroundCardView.layoutMarginsGuide.leadingAnchor),
            abilitiesButtonView.heightAnchor.constraint(equalToConstant: 52),
            abilitiesButtonView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 20),

            itemsButtonView.topAnchor.constraint(equalTo: movesButtonView.bottomAnchor, constant: 20),
            itemsButtonView.trailingAnchor.constraint(equalTo: backgroundCardView.layoutMarginsGuide.trailingAnchor),
            itemsButtonView.heightAnchor.constraint(equalToConstant: 52),
            itemsButtonView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 20),

            newsHeaderLabel.topAnchor.constraint(equalTo: backgroundCardView.bottomAnchor, constant: 50),
            newsHeaderLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),

            newsViewAllLabel.topAnchor.constraint(equalTo: backgroundCardView.bottomAnchor, constant: 50),
            newsViewAllLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),

            newsTableView.topAnchor.constraint(equalTo: newsHeaderLabel.bottomAnchor, constant: 20),
            newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newsTableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
        ])
    }

    private func backgroundCardViewSetup() {
        backgroundCardView = UIView()
        backgroundCardView.translatesAutoresizingMaskIntoConstraints = false
        backgroundCardView.backgroundColor = .white
        backgroundCardView.layer.cornerRadius = 25
        backgroundCardView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.addSubview(backgroundCardView)
        backgroundViewTopConstraint = backgroundCardView.topAnchor.constraint(equalTo: view.topAnchor)
        backgroundViewTopConstraint?.isActive = true
    }

    private func backgroundPokeballImageView(uiView: UIView, frame: CGRect, tintColor: UIColor) {
        let backgroundPokeballImage = UIImageView(frame: frame)
        backgroundPokeballImage.image = UIImage(named: "pokeball.png")?.withTintColor(tintColor)

        backgroundPokeballImage.alpha = 0.15
        backgroundPokeballImage.contentMode = .scaleAspectFit
        uiView.insertSubview(backgroundPokeballImage, at: 1)
    }

    private func headerLabelView() {
        headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.font = .systemFont(ofSize: 32, weight: .bold)
        headerLabel.text = "What Pokemon \n are you looking for?"
        headerLabel.numberOfLines = 0
        backgroundCardView.addSubview(headerLabel)
    }

    private func searchTextFieldView() {
        searchTextField = UITextField()
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.placeholder = "Search pokemon"
        searchTextField.font = UIFont.systemFont(ofSize: 18)
        searchTextField.layer.cornerRadius = 26
        searchTextField.backgroundColor = .systemGray5
        searchTextField.setRightPaddingPoints(10)

        let envelopeView = UIImageView(frame: CGRect(x: 10, y: 0, width: 30, height: 30))
        envelopeView.image = UIImage(systemName: "magnifyingglass")
        envelopeView.contentMode = .scaleAspectFill
        envelopeView.tintColor = .black
        let viewLeft = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        viewLeft.addSubview(envelopeView)
        searchTextField.leftView = viewLeft
        searchTextField.leftViewMode = .always

        backgroundCardView.addSubview(searchTextField)
    }

    private func pokedexButtonViewSetup() {
        pokedexButtonView = UIView()
        pokedexButtonView.translatesAutoresizingMaskIntoConstraints = false
        pokedexButtonView.backgroundColor = .systemTeal
        pokedexButtonView.layer.cornerRadius = 10

        let itemButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 52))
        itemButton.setTitle("Pokedex", for: .normal)
        itemButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        pokedexButtonView.addSubview(itemButton)

        backgroundPokeballImageView(uiView: itemButton, frame: CGRect(x: (UIScreen.main.bounds.width / 4) + 35, y: 5, width: 52, height: 52), tintColor: .white)

        backgroundCardView.addSubview(pokedexButtonView)
    }

    private func movesButtonViewSetup() {
        movesButtonView = UIView()
        movesButtonView.translatesAutoresizingMaskIntoConstraints = false
        movesButtonView.backgroundColor = .systemRed
        movesButtonView.layer.cornerRadius = 10

        let itemButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 52))
        itemButton.setTitle("Moves", for: .normal)
        itemButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        movesButtonView.addSubview(itemButton)

        backgroundPokeballImageView(uiView: itemButton, frame: CGRect(x: (UIScreen.main.bounds.width / 4) + 35, y: 5, width: 52, height: 52), tintColor: .white)

        backgroundCardView.addSubview(movesButtonView)
    }

    private func abilitiesButtonViewSetup() {
        abilitiesButtonView = UIView()
        abilitiesButtonView.translatesAutoresizingMaskIntoConstraints = false
        abilitiesButtonView.backgroundColor = .systemBlue
        abilitiesButtonView.layer.cornerRadius = 10

        let itemButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 52))
        itemButton.setTitle("Abilities", for: .normal)
        itemButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        abilitiesButtonView.addSubview(itemButton)

        backgroundPokeballImageView(uiView: itemButton, frame: CGRect(x: (UIScreen.main.bounds.width / 4) + 35, y: 5, width: 52, height: 52), tintColor: .white)

        backgroundCardView.addSubview(abilitiesButtonView)
    }

    private func itemsButtonViewSetup() {
        itemsButtonView = UIView()
        itemsButtonView.translatesAutoresizingMaskIntoConstraints = false
        itemsButtonView.backgroundColor = .systemYellow
        itemsButtonView.layer.cornerRadius = 10

        let itemButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 52))
        itemButton.setTitle("Items", for: .normal)
        itemButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        itemsButtonView.addSubview(itemButton)

        backgroundPokeballImageView(uiView: itemButton, frame: CGRect(x: (UIScreen.main.bounds.width / 4) + 35, y: 5, width: 52, height: 52), tintColor: .white)

        backgroundCardView.addSubview(itemsButtonView)
    }

    private func newsHeaderLabelView() {
        newsHeaderLabel = UILabel()
        newsHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        newsHeaderLabel.font = .systemFont(ofSize: 22, weight: .bold)
        newsHeaderLabel.text = "Pokemon News"
        view.addSubview(newsHeaderLabel)
    }

    private func newsViewAllLabelView() {
        newsViewAllLabel = UILabel()
        newsViewAllLabel.translatesAutoresizingMaskIntoConstraints = false
        newsViewAllLabel.textColor = .systemBlue
        newsViewAllLabel.text = "View All"
        view.addSubview(newsViewAllLabel)
    }

    private func newsTableViewSetup() {
        newsTableView = UITableView()
        newsTableView.translatesAutoresizingMaskIntoConstraints = false
        newsTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        newsTableView.dataSource = self
        newsTableView.delegate = self
        newsTableView.backgroundColor = Constants.backgroundColor
        newsTableView.showsVerticalScrollIndicator = false
        view.addSubview(newsTableView)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(newsTitle: "Pokemon Sword and Shield Players Can Get Three Free Mythical Pokemon Soon - CNET", imageName: "thumbnail", publishDate: "20 Oct 2022")
        return cell
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        100
    }
}

// MARK: - UIScrollViewDelegate

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_: UIScrollView) {
        let delta = newsTableView.contentOffset.y - lastContentOffset

        guard let backgroundViewTopConstraint = backgroundViewTopConstraint else {
            return
        }

        // we compress the top view
        if delta > 0,
           backgroundViewTopConstraint.constant > -topConstraintRange.upperBound,
           newsTableView.contentOffset.y > 0
        {
            backgroundViewTopConstraint.constant = max(-topConstraintRange.upperBound, backgroundViewTopConstraint.constant - delta)
            newsTableView.contentOffset.y -= delta
        }

        // we expand the top view
        if delta <= 0,
           backgroundViewTopConstraint.constant < topConstraintRange.lowerBound,
           newsTableView.contentOffset.y < 0
        {
            backgroundViewTopConstraint.constant = min(topConstraintRange.lowerBound, backgroundViewTopConstraint.constant - delta)
            newsTableView.contentOffset.y -= delta
        }

        lastContentOffset = newsTableView.contentOffset.y
    }
}
