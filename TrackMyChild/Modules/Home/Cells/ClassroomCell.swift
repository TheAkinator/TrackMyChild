//
//  ClassroomCell.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import UIKit

final class ClassroomCell: BaseUITableViewCell {
    var presenter: ClassroomCellPresenter? {
        didSet {
            nameLabel.text = presenter?.classroomName
            presenter?.fetchImage { result in
                switch result {
                case .success(let data):
                    let image = UIImage(data: data)
                    self.icon.image = image
                case .failure:
                    break
                }
            }
        }
    }

    private lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        if #available(iOS 13.0, *) {
            label.textColor = .label
        } else {
            label.textColor = .black
        }
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    private func setupViews() {
        addSubview(icon)
        icon.topAnchor(equalTo: self.topAnchor, constant: 16, priority: .defaultLow)
        icon.leadingAnchor(equalTo: self.leadingAnchor, constant: 16)
        icon.bottomAnchor(equalTo: self.bottomAnchor, constant: 16)
        icon.heightAnchor(equalTo: 60, priority: .required)
        icon.widthAnchor(equalTo: 60)

        addSubview(nameLabel)
        nameLabel.centerVertical(equalTo: icon.centerYAnchor)
        nameLabel.leadingAnchor(equalTo: icon.trailingAnchor, constant: 16)
        nameLabel.trailingAnchor(equalTo: self.trailingAnchor, constant: 16)
        nameLabel.heightAnchor(equalTo: 30, priority: .required)
    }
}
