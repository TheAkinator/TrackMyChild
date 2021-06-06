//
//  Classroom.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import Foundation

struct Classroom: Equatable {
    private enum Constants {
        static let idKey = "id"
        static let nameKey = "name"
        static let iconKey = "icon"
        static let childrenKey = "children"
    }

    var id: String
    var name: String
    var icon: String?
    var children: [Child]?

    init?(data: [String: [String: Any]]) {
        guard
            let id = data.first?.value[Constants.idKey] as? String,
            let name = data.first?.value[Constants.nameKey] as? String
        else {
            return nil
        }
        let icon = data.first?.value[Constants.iconKey] as? String
        let childrenData = data.first?.value[Constants.childrenKey] as? [String: [String: Any]]

        self.id = id
        self.name = name
        self.icon = icon
        var children = childrenData?.compactMap { child -> Child? in
            let childData: [String: [String: Any]] = [child.key: child.value]
            return Child(data: childData)
        }
        children = children?.sorted { $0.fullName < $1.fullName }
        self.children = children
    }
}
