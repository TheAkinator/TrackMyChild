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

    var id: String
    var fullName: String
    var checkedIn: Bool

    init?(data: Dictionary<String, [String: Any]>.Element) {
        guard
            let fullName = data.value[Constants.fullNameKey] as? String,
            let checkedIn = data.value[Constants.checkedInKey] as? Bool
        else {
            return nil
        }

        self.id = data.key
        self.fullName = fullName
        self.checkedIn = checkedIn
    }

    func toDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        dictionary[Constants.fullNameKey] = fullName
        dictionary[Constants.checkedInKey] = checkedIn
        return dictionary
    }
}
