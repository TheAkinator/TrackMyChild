//
//  ChildCell.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import UIKit

final class ChildCell: BaseUITableViewCell {
    var presenter: ChildrenPresenterProtocol?

    var child: Child? {
        didSet {
            guard let child = child else {
                return
            }
            nameLabel.text = child.fullName
            let checkInImage = child.checkedIn ? Images.fullCheckBox : Images.emptyCheckBox
            checkInButton.setImage(checkInImage, for: .normal)
        }
    }

    private lazy var nameTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.text = "Name"
        if #available(iOS 13.0, *) {
            label.textColor = .label
        } else {
            label.textColor = .black
        }
        return label
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

    private lazy var checkInTitle: UILabel = {
       let label = UILabel()
       label.font = .systemFont(ofSize: 14)
       label.text = "Checked In"
       if #available(iOS 13.0, *) {
           label.textColor = .label
       } else {
           label.textColor = .black
       }
       return label
   }()

    private lazy var checkInButton: HighlitableButton = {
        let button = HighlitableButton()
        button.setImage(Images.emptyCheckBox, for: .normal)
        return button
    }()

    private lazy var moreButton: HighlitableButton = {
        let button = HighlitableButton()
        button.setImage(Images.moreButton, for: .normal)
        return button
    }()

    var moreButtonAction: ((_ child: Child) -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.isUserInteractionEnabled = true
        setupViews()
        setupActions()
    }

    private func setupViews() {
        addSubviews(nameTitleLabel, nameLabel, checkInTitle, checkInButton, moreButton)

        nameTitleLabel.topAnchor(equalTo: self.topAnchor, constant: 16)
        nameTitleLabel.leadingAnchor(equalTo: self.leadingAnchor, constant: 16)
        nameTitleLabel.trailingAnchor(equalTo: checkInButton.leadingAnchor, constant: 10)

        nameLabel.topAnchor(equalTo: nameTitleLabel.bottomAnchor, constant: 5)
        nameLabel.leadingAnchor(equalTo: self.leadingAnchor, constant: 16)
        nameLabel.trailingAnchor(equalTo: checkInButton.leadingAnchor, constant: 10)
        nameLabel.bottomAnchor(equalTo: self.bottomAnchor, constant: 16)

        checkInTitle.centerHorizontal(equalTo: checkInButton.centerXAnchor)
        checkInTitle.centerVertical(equalTo: nameTitleLabel.centerYAnchor)

        checkInButton.centerVertical(equalTo: self.centerYAnchor, constant: 10)
        checkInButton.heightAnchor(equalTo: 40)
        checkInButton.widthAnchor(equalTo: 40)

        moreButton.centerVertical(equalTo: self.centerYAnchor, constant: 10)
        moreButton.leadingAnchor(equalTo: checkInButton.trailingAnchor, constant: 10)
        moreButton.trailingAnchor(equalTo: self.trailingAnchor, constant: 10)
        moreButton.heightAnchor(equalTo: 40)
        moreButton.widthAnchor(equalTo: 40)
    }

    private func setupActions() {
        checkInButton.addTarget(self, action: #selector(toggleCheckIn), for: .touchUpInside)
        moreButton.addTarget(self, action: #selector(didTapmoreButton), for: .touchUpInside)
    }

    @objc private func toggleCheckIn() {
        self.child?.checkedIn.toggle()
        guard let child = child else {
            return
        }
        if child.checkedIn {
            checkInButton.setImage(Images.fullCheckBox, for: .normal)
        } else {
            checkInButton.setImage(Images.emptyCheckBox, for: .normal)
        }
        presenter?.toogleCheckInFor(child: child)
    }

    @objc private func didTapmoreButton() {
        guard let child = child else {
            return
        }
        moreButtonAction?(child)
    }
}
