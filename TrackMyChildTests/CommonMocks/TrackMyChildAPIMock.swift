//
//  TrackMyChildAPIMock.swift
//  TrackMyChildTests
//
//  Created by RAirApps on 06/06/21.
//

@testable import TrackMyChild

// swiftlint:disable force_unwrapping
final class TrackMyChildAPIMock: TrackMyChildAPIProtocol {
    var teacher0: Teacher {
        let data: [String: Any] = [
            "classrooms": ["classroom-0", "classroom-1"],
            "name": "Raul"
        ]
        return Teacher(id: "teacher-0", data: data)
    }

    var teacher1: Teacher {
        let data: [String: Any] = [
            "classrooms": [],
            "name": "Arthur"
        ]
        return Teacher(id: "teacher-1", data: data)
    }

    var classroom0: Classroom {
        let data: [String: [String: Any]] = [
            "classroom-0": [
                "children": [
                    "child-0": [
                        "fullName": "Tino Martinez",
                        "checked_in": false
                    ],
                    "child-1": [
                        "fullName": "Lola Mendez",
                        "checked_in": false
                    ],
                    "child-2": [
                        "fullName": "Amar Bono",
                        "checked_in": false
                    ]
                ],
                "icon": "https://images-na.ssl-images-amazon.com/images/I/81Dl5GdAVkL.png",
                "id": "classroom-0",
                "name": "Apple room"
            ]
        ]
        return Classroom(data: data)!
    }

    var classroom1: Classroom {
        let data: [String: [String: Any]] = [
            "classroom-1": [
                "children": [
                    "child-0": [
                        "fullName": "Filipe Oliveira",
                        "checked_in": false
                    ],
                    "child-1": [
                        "fullName": "Kleber Muniz",
                        "checked_in": false
                    ],
                    "child-2": [
                        "fullName": "Karl Bono",
                        "checked_in": false
                    ]
                ],
                "icon": "https://images-na.ssl-images-amazon.com/images/I/81Dl5GdAVkL.png",
                "id": "classroom-1",
                "name": "Banana room"
            ]
        ]
        return Classroom(data: data)!
    }

    var didToogleCheckin: (() -> Void)?

    func fetchTeacherInfosFor(id: String, completion: @escaping (Result<Teacher, Error>) -> Void) {
        if id == "teacher-0" {
            completion(.success(teacher0))
        } else {
            completion(.failure(RequestError.invalidId))
        }
    }

    func fetchClassrooms(classroomsId: [String], completion: @escaping (Result<[Classroom], Error>) -> Void) {
        if !classroomsId.isEmpty {
            let classrooms = [classroom0, classroom1]
            completion(.success(classrooms))
        } else {
            completion(.failure(RequestError.invalidId))
        }
    }

    func setCheckInTo(_ checkedIn: Bool, for child: Child, in classroom: Classroom) {
        didToogleCheckin?()
    }

    func move(child: Child, from sourceClassroom: Classroom, to targetClassroom: Classroom, completion: @escaping () -> Void) {
        completion()
    }
}
