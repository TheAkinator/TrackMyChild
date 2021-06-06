//
//  UIViewController+Extension.swift
//  TrackMyChild
//
//  Created by RAirApps on 06/06/21.
//

import UIKit

extension UIViewController {
    func showAlert(withTitle title: String, andMessage message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(title: "Ok", style: .default) { _ in
                completion?()
            }
        )
        present(alert, animated: true, completion: nil)
    }
}
