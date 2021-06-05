//
//  ChildCell.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import UIKit

final class ChildCell: BaseUITableViewCell {
    var child: Child? {
        didSet {
            guard let child = child else {
                return
            }
            nameLabel.text = child.fullName
            accessoryType = child.checkedIn ? .checkmark : .none
        }
    }

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
        addSubview(nameLabel)
        nameLabel.topAnchor(equalTo: self.topAnchor, constant: 16)
        nameLabel.leadingAnchor(equalTo: self.leadingAnchor, constant: 16)
        nameLabel.trailingAnchor(equalTo: self.trailingAnchor, constant: 16)
        nameLabel.bottomAnchor(equalTo: self.bottomAnchor, constant: 16)
    }

    func toggleCheckIn() {
        switch accessoryType {
        case .none:
            accessoryType = .checkmark
        default:
            accessoryType = .none
        }
    }
}
