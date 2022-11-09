//
//  PokemonDetailsViewController.swift
//  Pokedex
//
//  Created by Keertiraj Laxman Malik on 04/11/22.
//

import UIKit

class PokemonDetailsViewController: UIViewController {
    private var detailsCardView: UIView!
    private var pokemonImageView: UIImageView!
    private var pokemonNameLabel: UILabel!
    private var pokemonTypeStack: UIStackView!
    private var pokemonNumberLabel: UILabel!
    private var pokemonDetailsSegmentedControl: UISegmentedControl!
    private var aboutDetail: UIView!
    private var baseStatsStackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = Constants.greenColor

        detailsCardViewSetup()
        backgroundImageView()
        pokemonImageViewSetup()
        pokemonNameLabelSetup()
        pokemonTypesLabelSetup(pokemonTypes: ["Grass", "Poison"])
        pokemonNumberLabelSetup()
        segmentedControlSetup()
        aboutDetailViewSetup(pokemonDetails: ["Species": "Seed", "Height": "2'3.6\"(0.70 cm)", "Weight": "15.2 lbs (6.9 kg)", "Abilities": "Overgrow, Chlorophyl"])
        NSLayoutConstraint.activate([
            detailsCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailsCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailsCardView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -75),
            detailsCardView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            pokemonNameLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 25),
            pokemonNameLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            pokemonNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.layoutMarginsGuide.trailingAnchor),
            pokemonNameLabel.heightAnchor.constraint(equalToConstant: 44),

            pokemonTypeStack.topAnchor.constraint(equalTo: pokemonNameLabel.bottomAnchor, constant: 10),
            pokemonTypeStack.heightAnchor.constraint(equalToConstant: 24),
            pokemonTypeStack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),

            pokemonNumberLabel.topAnchor.constraint(equalTo: pokemonNameLabel.bottomAnchor, constant: -30),
            pokemonNumberLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pokemonNumberLabel.widthAnchor.constraint(equalToConstant: 60),
            pokemonNumberLabel.heightAnchor.constraint(equalToConstant: 44),

            pokemonDetailsSegmentedControl.topAnchor.constraint(equalTo: detailsCardView.topAnchor, constant: 25),
            pokemonDetailsSegmentedControl.leadingAnchor.constraint(equalTo: detailsCardView.leadingAnchor),
            pokemonDetailsSegmentedControl.trailingAnchor.constraint(equalTo: detailsCardView.trailingAnchor),
            pokemonDetailsSegmentedControl.heightAnchor.constraint(equalToConstant: 44),
        ])
    }

    private func detailsCardViewSetup() {
        detailsCardView = UIView()
        detailsCardView.translatesAutoresizingMaskIntoConstraints = false
        detailsCardView.backgroundColor = .white
        detailsCardView.layer.cornerRadius = 30
        view.addSubview(detailsCardView)
    }

    private func backgroundImageView() {
        let backgroundPokeballImage = UIImageView(frame: CGRect(x: UIScreen.main.bounds.width * 0.60, y: (UIScreen.main.bounds.height / 4) - 25, width: 175, height: 175))
        backgroundPokeballImage.image = UIImage(named: "pokeball")?.withTintColor(.white)
        backgroundPokeballImage.alpha = 0.25
        backgroundPokeballImage.contentMode = .scaleAspectFit
        view.insertSubview(backgroundPokeballImage, at: 0)

        let backgroundDottedImage = UIImageView(frame: CGRect(x: UIScreen.main.bounds.width / 4, y: (UIScreen.main.bounds.height / 4) - 25, width: 60, height: 60))
        backgroundDottedImage.image = UIImage(named: "dotted")
        backgroundDottedImage.alpha = 0.25
        backgroundDottedImage.contentMode = .scaleAspectFit
        view.insertSubview(backgroundDottedImage, at: 0)
    }

    private func pokemonImageViewSetup() {
        let cellHeight = UIScreen.main.bounds.height / 2
        let cellWidth = UIScreen.main.bounds.width / 2
        pokemonImageView = UIImageView(
            frame: CGRect(x: (cellWidth / 2) - 10,
                          y: (cellHeight / 2) - 40,
                          width: cellWidth + 25,
                          height: cellHeight / 2))
        pokemonImageView.image = UIImage(named: "pokemon")
        view.addSubview(pokemonImageView)
    }

    private func pokemonNameLabelSetup() {
        pokemonNameLabel = UILabel()
        pokemonNameLabel.textColor = .white
        pokemonNameLabel.font = .systemFont(ofSize: 34, weight: .bold)
        pokemonNameLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonNameLabel.text = "Bulbasaur"
        view.addSubview(pokemonNameLabel)
    }

    private func pokemonTypesLabelSetup(pokemonTypes types: [String]) {
        pokemonTypeStack = UIStackView()
        pokemonTypeStack.spacing = 5
        pokemonTypeStack.axis = .horizontal
        pokemonTypeStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pokemonTypeStack)

        pokemonTypeStack.widthAnchor.constraint(equalToConstant: types.count == 1 ? 60 : CGFloat((types.count * 60) + ((types.count - 1) * 5))).isActive = true

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
                pokemonTypesLabel.widthAnchor.constraint(equalToConstant: 60),
                pokemonTypesLabel.heightAnchor.constraint(equalTo: pokemonTypeStack.heightAnchor),
            ])
        }
    }

    private func pokemonNumberLabelSetup() {
        pokemonNumberLabel = UILabel()
        pokemonNumberLabel.textColor = .white
        pokemonNumberLabel.font = .systemFont(ofSize: 20, weight: .bold)
        pokemonNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonNumberLabel.text = "#001"
        view.addSubview(pokemonNumberLabel)
    }

    private func segmentedControlSetup() {
        let segments = ["About", "Base Stats", "Evolution", "Moves"]
        pokemonDetailsSegmentedControl = UISegmentedControl(items: segments)
        pokemonDetailsSegmentedControl.selectedSegmentIndex = 0
        pokemonDetailsSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        pokemonDetailsSegmentedControl.highlightSelectedSegment()
        pokemonDetailsSegmentedControl.addTarget(self, action: #selector(changeDetailView), for: .valueChanged)
        view.addSubview(pokemonDetailsSegmentedControl)
    }

    @objc private func changeDetailView(sender: UISegmentedControl) {
        pokemonDetailsSegmentedControl.underlinePosition()

        if sender.selectedSegmentIndex == 0 {
            baseStatsStackView.removeFromSuperview()
            aboutDetailViewSetup(pokemonDetails: ["Species": "Seed", "Height": "2'3.6\"(0.70 cm)", "Weight": "15.2 lbs (6.9 kg)", "Abilities": "Overgrow, Chlorophyl"])
        } else if sender.selectedSegmentIndex == 1 {
            aboutDetail.removeFromSuperview()
            let stats = ["HP": 45, "Attack": 60, "Defence": 48, "Sp.Atk": 65, "Sp.Def": 65, "Speed": 45, "Total": 317]
            baseStatsLabelSetup(pokemonStats: stats)
        }
    }

    private func aboutDetailViewSetup(pokemonDetails details: [String: String]) {
        aboutDetail = UIView()
        aboutDetail.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aboutDetail)

        let aboutDetailStackView = UIStackView()
        aboutDetailStackView.spacing = 5
        aboutDetailStackView.axis = .vertical
        aboutDetailStackView.translatesAutoresizingMaskIntoConstraints = false
        aboutDetail.addSubview(aboutDetailStackView)

        for (index, detail) in details.enumerated() {
            let detailView = UIView()
            aboutDetailStackView.addArrangedSubview(detailView)

            let speciesLabel = UILabel()
            speciesLabel.text = detail.key
            speciesLabel.textColor = UIColor.gray
            speciesLabel.translatesAutoresizingMaskIntoConstraints = false
            detailView.addSubview(speciesLabel)

            let abilitiesValueLabel = UILabel()
            abilitiesValueLabel.text = detail.value
            abilitiesValueLabel.translatesAutoresizingMaskIntoConstraints = false
            detailView.addSubview(abilitiesValueLabel)

            NSLayoutConstraint.activate([
                speciesLabel.topAnchor.constraint(equalTo: aboutDetailStackView.topAnchor, constant: index == 0 ? 25 : CGFloat((35 * index) + 25)),
                speciesLabel.leadingAnchor.constraint(equalTo: aboutDetailStackView.leadingAnchor, constant: 25),
                speciesLabel.widthAnchor.constraint(equalToConstant: 100),

                abilitiesValueLabel.topAnchor.constraint(equalTo: speciesLabel.topAnchor),
                abilitiesValueLabel.leadingAnchor.constraint(equalTo: speciesLabel.trailingAnchor),
            ])
        }

        let BreedingHeaderLabel = UILabel()
        BreedingHeaderLabel.text = "Breeding"
        BreedingHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        BreedingHeaderLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        aboutDetail.addSubview(BreedingHeaderLabel)

        let genderLabel = UILabel()
        genderLabel.text = "Gender"
        genderLabel.textColor = UIColor.gray
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutDetail.addSubview(genderLabel)

        let eggGroupsLabel = UILabel()
        eggGroupsLabel.text = "Egg Groups"
        eggGroupsLabel.textColor = UIColor.gray
        eggGroupsLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutDetail.addSubview(eggGroupsLabel)

        let genderValueLabel = UILabel()
        addImageInUILabel(label: genderValueLabel)
        genderValueLabel.translatesAutoresizingMaskIntoConstraints = false
        genderValueLabel.clipsToBounds = true
        aboutDetail.addSubview(genderValueLabel)

        let eggGroupsValueLabel = UILabel()
        eggGroupsValueLabel.text = "Monster"
        eggGroupsValueLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutDetail.addSubview(eggGroupsValueLabel)

        NSLayoutConstraint.activate([
            aboutDetailStackView.topAnchor.constraint(equalTo: pokemonDetailsSegmentedControl.bottomAnchor),
            aboutDetailStackView.leadingAnchor.constraint(equalTo: detailsCardView.leadingAnchor),
            aboutDetailStackView.trailingAnchor.constraint(equalTo: detailsCardView.trailingAnchor),
            aboutDetailStackView.heightAnchor.constraint(equalToConstant: CGFloat((35 * details.count) + 25)),

            BreedingHeaderLabel.topAnchor.constraint(equalTo: aboutDetailStackView.bottomAnchor, constant: 25),
            BreedingHeaderLabel.leadingAnchor.constraint(equalTo: detailsCardView.leadingAnchor, constant: 25),
            BreedingHeaderLabel.widthAnchor.constraint(equalToConstant: 100),

            genderLabel.topAnchor.constraint(equalTo: BreedingHeaderLabel.bottomAnchor, constant: 10),
            genderLabel.leadingAnchor.constraint(equalTo: detailsCardView.leadingAnchor, constant: 25),
            genderLabel.widthAnchor.constraint(equalToConstant: 100),

            eggGroupsLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10),
            eggGroupsLabel.leadingAnchor.constraint(equalTo: detailsCardView.leadingAnchor, constant: 25),
            eggGroupsLabel.widthAnchor.constraint(equalToConstant: 100),

            genderValueLabel.topAnchor.constraint(equalTo: BreedingHeaderLabel.bottomAnchor, constant: 10),
            genderValueLabel.leadingAnchor.constraint(equalTo: genderLabel.trailingAnchor),
            genderValueLabel.trailingAnchor.constraint(equalTo: detailsCardView.trailingAnchor),

            eggGroupsValueLabel.topAnchor.constraint(equalTo: genderValueLabel.bottomAnchor, constant: 10),
            eggGroupsValueLabel.leadingAnchor.constraint(equalTo: eggGroupsLabel.trailingAnchor),
            eggGroupsValueLabel.trailingAnchor.constraint(equalTo: detailsCardView.trailingAnchor),
        ])
    }

    private func addImageInUILabel(label: UILabel) {
        let fullString = NSMutableAttributedString(string: "")

        let maleImageAttachment = NSTextAttachment()
        maleImageAttachment.image = UIImage(named: "male")
        maleImageAttachment.bounds = CGRect(x: 0, y: 0, width: 16, height: 16)
        let maleImageString = NSAttributedString(attachment: maleImageAttachment)

        let femaleImageAttachment = NSTextAttachment()
        femaleImageAttachment.image = UIImage(named: "female")
        femaleImageAttachment.bounds = CGRect(x: 0, y: 0, width: 16, height: 16)
        let femaleImageString = NSAttributedString(attachment: femaleImageAttachment)

        fullString.append(maleImageString)
        fullString.append(NSAttributedString(string: " 87.5%"))
        fullString.append(NSAttributedString(string: "    "))
        fullString.append(femaleImageString)
        fullString.append(NSAttributedString(string: " 12.5%"))

        label.attributedText = fullString
    }

    private func baseStatsLabelSetup(pokemonStats stats: [String: Int]) {
        baseStatsStackView = UIStackView()
        baseStatsStackView.spacing = 5
        baseStatsStackView.axis = .vertical
        baseStatsStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(baseStatsStackView)

        for (index, stat) in stats.enumerated() {
            let statView = UIView()
            baseStatsStackView.addArrangedSubview(statView)

            let statLabel = UILabel()
            statLabel.text = stat.key
            statLabel.textColor = UIColor.gray
            statLabel.translatesAutoresizingMaskIntoConstraints = false
            statView.addSubview(statLabel)

            let statValueLabel = UILabel()
            statValueLabel.text = stat.value.description
            statValueLabel.translatesAutoresizingMaskIntoConstraints = false
            statView.addSubview(statValueLabel)

            let statProgressBar = UIProgressView(progressViewStyle: .bar)
            statProgressBar.translatesAutoresizingMaskIntoConstraints = false
            statProgressBar.progressTintColor = Constants.redColor
            statProgressBar.backgroundColor = UIColor.systemGray5
            statProgressBar.setProgress(Float(stat.value) / 100, animated: true)
            statView.addSubview(statProgressBar)

            NSLayoutConstraint.activate([
                statLabel.topAnchor.constraint(equalTo: baseStatsStackView.topAnchor, constant: index == 0 ? 25 : CGFloat((35 * index) + 25)),
                statLabel.leadingAnchor.constraint(equalTo: baseStatsStackView.leadingAnchor, constant: 25),
                statLabel.widthAnchor.constraint(equalToConstant: 75),

                statValueLabel.topAnchor.constraint(equalTo: statLabel.topAnchor),
                statValueLabel.leadingAnchor.constraint(equalTo: statLabel.trailingAnchor),
                statValueLabel.widthAnchor.constraint(equalToConstant: 50),

                statProgressBar.topAnchor.constraint(equalTo: statLabel.topAnchor, constant: 10),
                statProgressBar.leadingAnchor.constraint(equalTo: statValueLabel.trailingAnchor),
                statProgressBar.trailingAnchor.constraint(equalTo: detailsCardView.trailingAnchor, constant: -25),
            ])
        }

        NSLayoutConstraint.activate([
            baseStatsStackView.topAnchor.constraint(equalTo: pokemonDetailsSegmentedControl.bottomAnchor),
            baseStatsStackView.leadingAnchor.constraint(equalTo: detailsCardView.leadingAnchor),
            baseStatsStackView.trailingAnchor.constraint(equalTo: detailsCardView.trailingAnchor),
            baseStatsStackView.bottomAnchor.constraint(equalTo: detailsCardView.bottomAnchor),
        ])
    }
}
