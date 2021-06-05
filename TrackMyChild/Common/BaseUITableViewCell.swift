//
//  BaseUITableViewCell.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import UIKit

class BaseUITableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
