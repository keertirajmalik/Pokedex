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
    private var pokemonTypeStack: UIStackView!
    private var pokemonTypeLabel: UILabel!
    private var pokemonTypesView: UIView!
    private var pokemonTypeStackHeightConstraint: NSLayoutConstraint?

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        backgroundCardViewSetup()
        backgroundPokeballImageView()
        pokemonImageViewSetup()
        pokemonNumberLabelSetup()
        pokemonNameLabelSetup()
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

    private func pokemonTypesLabelSetup(pokemonTypes types: [String]) {
        pokemonTypeStack = UIStackView()
        pokemonTypeStack.spacing = 5
        pokemonTypeStack.axis = .vertical
        pokemonTypeStack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pokemonTypeStack)

        pokemonTypeStack.heightAnchor.constraint(equalToConstant: types.count == 1 ? 20 : CGFloat((types.count * 20) + ((types.count - 1) * 5))).isActive = true

        for type in types {
            let pokemonTypesLabel = UILabel()
            pokemonTypesLabel.text = type
            pokemonTypesLabel.backgroundColor = .init(white: 1, alpha: 0.35)
            pokemonTypesLabel.layer.cornerRadius = 10
            pokemonTypesLabel.textAlignment = .center
            pokemonTypesLabel.textColor = .white
            pokemonTypesLabel.font = .systemFont(ofSize: 14)
            pokemonTypesLabel.layer.masksToBounds = true
            pokemonTypesLabel.translatesAutoresizingMaskIntoConstraints = false
            pokemonTypeStack.addArrangedSubview(pokemonTypesLabel)
            NSLayoutConstraint.activate([
                pokemonTypesLabel.widthAnchor.constraint(equalTo: pokemonTypeStack.widthAnchor),
                pokemonTypesLabel.heightAnchor.constraint(equalToConstant: 20),
            ])
        }
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

            pokemonTypeStack.topAnchor.constraint(equalTo: pokemonNameLabel.bottomAnchor),
            pokemonTypeStack.trailingAnchor.constraint(equalTo: pokemonImageView.leadingAnchor),
            pokemonTypeStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
        ])
    }

    public func configure(backgroundColor: UIColor, pokemonImage: String, pokemonNumber: String, pokemonName: String, pokemonTypes: [String]) {
        backgroundCardView.backgroundColor = backgroundColor
        pokemonImageView.image = UIImage(named: pokemonImage)
        pokemonNumberLabel.text = pokemonNumber
        pokemonNameLabel.text = pokemonName
        pokemonTypesLabelSetup(pokemonTypes: pokemonTypes)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundCardView.backgroundColor = nil
        pokemonImageView.image = nil
        pokemonNumberLabel.text = nil
        pokemonNameLabel.text = nil
        pokemonTypeStack.removeFromSuperview()
    }
}
