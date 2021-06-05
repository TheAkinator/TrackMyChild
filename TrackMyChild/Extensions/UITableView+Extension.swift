//
//  UITableView+Extension.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import UIKit

extension UITableView {
    // Register cell from class reference
    func register<T: UITableViewCell>(_: T.Type) {
        let identifier = String(describing: T.self)
        register(T.self, forCellReuseIdentifier: identifier)
    }

    // Dequeue cell from class reference
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        let identifier = String(describing: T.self)
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Cell indentifier not found for: \(identifier)")
        }

        return cell
    }
}
