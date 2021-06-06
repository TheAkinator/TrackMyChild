//
//  Teacher.swift
//  TrackMyChild
//
//  Created by RAirApps on 06/06/21.
//

import Foundation

class Teacher: Codable {
    private enum Constants {
        static let nameKey = "name"
        static let classroomsKey = "classrooms"
    }

    var id: String
    var name: String
    var classrooms: [String]

    init(id: String, data: [String: Any]) {
        let name = data[Constants.nameKey] as? String ?? ""
        let classrooms = data[Constants.classroomsKey] as? [String] ?? []

        self.id = id
        self.name = name
        self.classrooms = classrooms
    }
}
