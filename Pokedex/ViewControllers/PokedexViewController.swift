//
//  PokedexViewController.swift
//  Pokedex
//
//  Created by Keertiraj Laxman Malik on 25/10/22.
//

import UIKit

class PokedexViewController: UIViewController {
    private var pokedexCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = Constants.backgroundColor

        pokemonCollectionViewSetup()

        NSLayoutConstraint.activate([
            pokedexCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            pokedexCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pokedexCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pokedexCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    private func pokemonCollectionViewSetup() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - 24, height: 150)

        pokedexCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        pokedexCollectionView.register(PokedexCollectionViewCell.self,
                                       forCellWithReuseIdentifier: PokedexCollectionViewCell.identifier)
        pokedexCollectionView.translatesAutoresizingMaskIntoConstraints = false
        pokedexCollectionView.dataSource = self
        pokedexCollectionView.delegate = self
        pokedexCollectionView.backgroundColor = Constants.backgroundColor
        pokedexCollectionView.showsVerticalScrollIndicator = false
        view.addSubview(pokedexCollectionView)
    }
}

extension PokedexViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokedexCollectionViewCell.identifier, for: indexPath)
            as? PokedexCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.configure(backgroundColor: .init(red: 67 / 255, green: 209 / 255, blue: 179 / 255, alpha: 1.0), pokemonImage: "pokemon", pokemonNumber: "#0001", pokemonName: "Bulbasur", pokemonTypes: ["Poison", "Flying"])
        return cell
    }
}

// .init(red: 252 / 255, green: 105 / 255, blue: 106 / 255, alpha: 1.0) Charmander Red
// .init(red: 121 / 255, green: 201 / 255, blue: 255 / 255, alpha: 1.0) Squirtle Blue
// .init(red: 67 / 255, green: 209 / 255, blue: 179 / 255, alpha: 1.0) bulbasur green
