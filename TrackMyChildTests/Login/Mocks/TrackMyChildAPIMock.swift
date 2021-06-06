//
//  TrackMyChildAPIMock.swift
//  TrackMyChildTests
//
//  Created by RAirApps on 06/06/21.
//

@testable import TrackMyChild

final class TrackMyChildAPIMock: TrackMyChildAPIProtocol {
    var teacher: Teacher {
        let data: [String: Any] = [
            "classrooms": ["classroom-0", "classroom-1"],
            "name": "Raul"
        ]
        return Teacher(id: "teacher-0", data: data)
    }

    func fetchTeacherInfosFor(id: String, completion: @escaping (Result<Teacher, Error>) -> Void) {
        if id == "teacher-0" {
            completion(.success(teacher))
        } else {
            completion(.failure(RequestError.invalidId))
        }
    }

    func fetchClassrooms(classroomsId: [String], completion: @escaping (Result<[Classroom], Error>) -> Void) {
    }

    func setCheckInTo(_ checkedIn: Bool, for child: Child, in classroom: Classroom) {
    }

    func move(child: Child, from sourceClassroom: Classroom, to targetClassroom: Classroom, completion: @escaping () -> Void) {
    }
}
