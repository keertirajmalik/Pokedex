//
//  PokedexCollectionViewCell.swift
//  Pokedex
//
//  Created by Keertiraj Laxman Malik on 25/10/22.
//

import UIKit

class PokedexCollectionViewCell: UICollectionViewCell {
    static let identifier = "PokedexCollectionViewCell"
    private var backgroundCardView: UIView!
    private var pokemonImageView: UIImageView!
    private var pokemonNumberLabel: UILabel!
    private var pokemonNameLabel: UILabel!
    private var pokemonTypesView: UIView!
    private var pokemonTypeLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        backgroundCardViewSetup()
        backgroundPokeballImageView()
        pokemonImageViewSetup()
        pokemonNumberLabelSetup()
        pokemonNameLabelSetup()
        pokemonTypesLabelSetup()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func backgroundCardViewSetup() {
        backgroundCardView = UIView()
        backgroundCardView.layer.cornerRadius = 15
        backgroundCardView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(backgroundCardView)
    }

    private func backgroundPokeballImageView() {
        let cellHeight = contentView.frame.size.height
        let cellWidth = contentView.frame.size.width

        let backgroundPokeballImage = UIImageView(
            frame: CGRect(x: (cellWidth / 2) - 10,
                          y: (cellHeight / 2) - 10,
                          width: (cellWidth / 2) + 30,
                          height: (cellHeight / 2) + 30))
        backgroundPokeballImage.image = UIImage(named: "pokeball")?.withTintColor(.white)
        backgroundPokeballImage.alpha = 0.25
        backgroundPokeballImage.contentMode = .scaleAspectFit
        contentView.insertSubview(backgroundPokeballImage, at: 1)
    }

    private func pokemonImageViewSetup() {
        let cellHeight = contentView.frame.size.height
        let cellWidth = contentView.frame.size.width
        pokemonImageView = UIImageView(
            frame: CGRect(x: (cellWidth / 2) - 20,
                          y: (cellHeight / 2) - 20,
                          width: (cellWidth / 2) + 20,
                          height: (cellHeight / 2) + 20))
        contentView.addSubview(pokemonImageView)
    }

    private func pokemonNumberLabelSetup() {
        pokemonNumberLabel = UILabel()
        pokemonNumberLabel.textColor = .systemGray
        pokemonNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pokemonNumberLabel)
    }

    private func pokemonNameLabelSetup() {
        pokemonNameLabel = UILabel()
        pokemonNameLabel.textColor = .white
        pokemonNameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        pokemonNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pokemonNameLabel)
    }

    private func pokemonTypesLabelSetup() {
        pokemonTypesView = UIView()
        pokemonTypesView.backgroundColor = .white
        pokemonTypesView.alpha = 0.25
        pokemonTypesView.layer.cornerRadius = 6
        pokemonTypesView.translatesAutoresizingMaskIntoConstraints = false

        pokemonTypeLabel = UILabel()
        pokemonTypeLabel.textColor = .init(white: 1, alpha: 1)
        pokemonTypeLabel.textAlignment = .center
        pokemonTypeLabel.adjustsFontSizeToFitWidth = true
        pokemonTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonTypeLabel.addSubview(pokemonTypesView)
        contentView.addSubview(pokemonTypeLabel)
        // TODO: Create a stack view based on number of abilites add more views to subview
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            backgroundCardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundCardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            pokemonNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            pokemonNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            pokemonNumberLabel.widthAnchor.constraint(equalToConstant: 52),
            pokemonNumberLabel.heightAnchor.constraint(equalToConstant: 44),

            pokemonNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            pokemonNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            pokemonNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            pokemonNameLabel.heightAnchor.constraint(equalToConstant: 44),

            pokemonTypeLabel.topAnchor.constraint(equalTo: pokemonNameLabel.bottomAnchor),
            pokemonTypeLabel.trailingAnchor.constraint(equalTo: pokemonImageView.leadingAnchor),
            pokemonTypeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            pokemonTypeLabel.heightAnchor.constraint(equalToConstant: 20),

            pokemonTypesView.topAnchor.constraint(equalTo: pokemonTypeLabel.topAnchor),
            pokemonTypesView.trailingAnchor.constraint(equalTo: pokemonTypeLabel.trailingAnchor),
            pokemonTypesView.leadingAnchor.constraint(equalTo: pokemonTypeLabel.leadingAnchor),
            pokemonTypesView.bottomAnchor.constraint(equalTo: pokemonTypeLabel.bottomAnchor),
        ])
    }

    public func configure(backgroundColor: UIColor, pokemonImage: String, pokemonNumber: String, pokemonName: String, pokemonTypes: String) {
        backgroundCardView.backgroundColor = backgroundColor
        pokemonImageView.image = UIImage(named: pokemonImage)
        pokemonNumberLabel.text = pokemonNumber
        pokemonNameLabel.text = pokemonName
        pokemonTypeLabel.text = pokemonTypes
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundCardView.backgroundColor = nil
        pokemonImageView.image = nil
        pokemonNumberLabel.text = nil
        pokemonNameLabel.text = nil
        pokemonTypeLabel.text = nil
    }
}
