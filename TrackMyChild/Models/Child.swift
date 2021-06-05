//
//  Child.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import Foundation

struct Child {
    private enum Constants {
        static let fullNameKey = "fullName"
        static let checkedInKey = "checked_in"
    }

    var fullName: String
    var checkedIn: Bool

    init?(data: [String: Any]) {
        guard let fullName = data[Constants.fullNameKey] as? String,
              let checkedIn = data[Constants.checkedInKey] as? Bool else {
            return nil
        }
        self.fullName = fullName
        self.checkedIn = checkedIn
    }
}
