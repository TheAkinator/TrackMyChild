//
//  Classroom.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import Foundation

struct Classroom {
    private enum Constants {
        static let idKey = "id"
        static let nameKey = "name"
        static let iconKey = "icon"
        static let childrenKey = "children"
    }

    var firebaseId: Int
    var id: String
    var name: String
    var icon: String
    var children: [Child]

    init?(firebaseId: Int, data: [String: Any]) {
        guard
            let id = data[Constants.idKey] as? String,
            let name = data[Constants.nameKey] as? String,
            let icon = data[Constants.iconKey] as? String,
            let childrenData = data[Constants.childrenKey] as? [[String: Any]]
        else {
            return nil
        }

        self.firebaseId = firebaseId
        self.id = id
        self.name = name
        self.icon = icon
        self.children = childrenData.enumerated().compactMap { index, child in
            Child(firebaseId: index, data: child)
        }
    }
}
