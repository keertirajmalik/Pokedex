//
//  ViewController.swift
//  Pokedex
//
//  Created by Keertiraj Laxman Malik on 11/10/22.
//

import UIKit

class HomeViewController: UIViewController {
    var headerLabel: UILabel!
    var searchTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white

        headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.font = .systemFont(ofSize: 35, weight: .bold)
        headerLabel.text = "What pokemon are you looking for?"
        headerLabel.numberOfLines = 0
        view.addSubview(headerLabel)

        searchTextField = UITextField()
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.placeholder = "Search pokemon"
        searchTextField.font = UIFont.systemFont(ofSize: 18)
        searchTextField.layer.cornerRadius = 5
        searchTextField.backgroundColor = .systemGray5
        searchTextField.setRightPaddingPoints(10)

        let envelopeView = UIImageView(frame: CGRect(x: 10, y: 0, width: 30, height: 30))
        let image = UIImage(systemName: "magnifyingglass")
        envelopeView.image = image
        envelopeView.contentMode = .scaleAspectFill
        envelopeView.tintColor = .black
        let viewLeft = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        viewLeft.addSubview(envelopeView)
        searchTextField.leftView = viewLeft
        searchTextField.leftViewMode = .always

        view.addSubview(searchTextField)

        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 50),
            headerLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),

            searchTextField.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            searchTextField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            searchTextField.heightAnchor.constraint(equalToConstant: 52),
        ])
    }
}
