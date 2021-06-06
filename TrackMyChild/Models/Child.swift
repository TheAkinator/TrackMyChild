//
//  Child.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import Foundation

struct Child: Equatable {
    private enum Constants {
        static let fullNameKey = "fullName"
        static let checkedInKey = "checked_in"
    }

    var id: String
    var fullName: String
    var checkedIn: Bool

    init?(data: [String: [String: Any]]) {
        guard
            let id = data.first?.key,
            let fullName = data.first?.value[Constants.fullNameKey] as? String,
            let checkedIn = data.first?.value[Constants.checkedInKey] as? Bool
        else {
            return nil
        }

        self.id = id
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
