//
//  ViewController.swift
//  Pokedex
//
//  Created by Keertiraj Laxman Malik on 11/10/22.
//

import UIKit

class HomeViewController: UIViewController {
    private var headerLabel: UILabel!
    private var searchTextField: UITextField!
    private var itemButtonView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func backgroundPokeballImageView() {
        let backgroundPokeballImage = UIImageView(frame: CGRect(x: UIScreen.main.bounds.width - 150, y: -75, width: 250, height: 250))
        backgroundPokeballImage.image = UIImage(named: "pokeball.png")
        backgroundPokeballImage.alpha = 0.15
        backgroundPokeballImage.contentMode = .scaleAspectFit
        view.insertSubview(backgroundPokeballImage, at: 0)
    }

    private func headerLabelView() {
        headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.font = .systemFont(ofSize: 32, weight: .bold)
        headerLabel.text = "What Pokemon \n are you looking for?"
        headerLabel.numberOfLines = 0
        view.addSubview(headerLabel)
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

        view.addSubview(searchTextField)
    }

    private func itemButtonViewSetup() {
        itemButtonView = UIView()
        itemButtonView.translatesAutoresizingMaskIntoConstraints = false
        itemButtonView.backgroundColor = .systemTeal
        itemButtonView.layer.cornerRadius = 10

        let itemButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 52))
        itemButton.setTitle("Pokedex", for: .normal)
        itemButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        itemButtonView.addSubview(itemButton)

        let backgroundPokeballImage = UIImageView(frame: CGRect(x: (UIScreen.main.bounds.width / 4) + 35, y: 5, width: 52, height: 52))
        backgroundPokeballImage.image = UIImage(named: "pokeball.png")?.withTintColor(.white)
        backgroundPokeballImage.alpha = 0.30
        backgroundPokeballImage.contentMode = .scaleAspectFit
        itemButtonView.insertSubview(backgroundPokeballImage, at: 0)

        view.addSubview(itemButtonView)
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white

        backgroundPokeballImageView()
        headerLabelView()
        searchTextFieldView()
        itemButtonViewSetup()

        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 75),
            headerLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),

            searchTextField.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            searchTextField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            searchTextField.heightAnchor.constraint(equalToConstant: 52),

            itemButtonView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            itemButtonView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            itemButtonView.heightAnchor.constraint(equalToConstant: 52),
            itemButtonView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 20),
        ])
    }
}
