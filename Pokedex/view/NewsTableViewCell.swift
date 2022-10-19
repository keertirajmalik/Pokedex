//
//  NewsTableViewCell.swift
//  Pokedex
//
//  Created by Keertiraj Laxman Malik on 19/10/22.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    static let identifier = "NewsTableViewCell"

    private let newsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()

    private let newsDateLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        return label
    }()

    private let newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = Constants.backgroundColor
        contentView.addSubview(newsLabel)
        contentView.addSubview(newsDateLabel)
        contentView.addSubview(newsImageView)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(text: String, imageName: String) {
        newsLabel.text = text
        newsImageView.image = UIImage(named: imageName)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        newsLabel.text = nil
        newsImageView.image = nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let cellHeight = contentView.frame.size.height
        let cellWidth = contentView.frame.size.width
        newsLabel.frame = CGRect(x: 20, y: 0, width: cellWidth * (3 / 4) - 20, height: cellHeight * (3 / 4))
        newsDateLabel.frame = CGRect(x: 20, y: cellHeight - (cellHeight / 4) - 10, width: cellWidth * (3 / 4) - 20, height: cellHeight / 4)
        newsImageView.frame = CGRect(x: cellWidth - cellHeight - 20, y: 10, width: cellHeight, height: cellHeight - 20)
    }
}
