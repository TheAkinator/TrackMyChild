//
//  TrackMyChildAPI.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import Firebase

protocol TrackMyChildAPIProtocol {
    func fetchClassrooms(completion: @escaping (Result<[Classroom], Error>) -> Void)
    func setCheckInTo(_ checkedIn: Bool, for child: Child, in classroom: Classroom)
    func move(
        child: Child,
        from sourceClassroom: Classroom,
        to targetClassroom: Classroom,
        completion: @escaping () -> Void
    )
}

final class TrackMyChildAPI: TrackMyChildAPIProtocol {
    private enum Constants {
        static let data = "data"
        static let center = "center"
        static let classrooms = "classrooms"
        static let children = "children"
        static let checkedIn = "checked_in"
        static let teachers = "teachers"
    }

    private let databaseReference: DatabaseReference

    init(databaseReference: DatabaseReference = Database.database().reference()) {
        self.databaseReference = databaseReference
    }

    deinit {
        databaseReference.removeAllObservers()
    }

    func fetchClassrooms(completion: @escaping (Result<[Classroom], Error>) -> Void) {
        databaseReference
            .child(Constants.data)
            .child(Constants.center)
            .child(Constants.classrooms)
            .observe(.value) { snapshot in
                guard let classroomsData = snapshot.value as? [String: [String: Any]] else {
                    return
                }

                var classrooms = classroomsData.compactMap { classroomData in
                    Classroom(data: classroomData)
                }
                classrooms = classrooms.sorted { $0.name < $1.name }
                completion(.success(classrooms))
            }
    }

    func setCheckInTo(_ checkedIn: Bool, for child: Child, in classroom: Classroom) {
        databaseReference
            .child(Constants.data)
            .child(Constants.center)
            .child(Constants.classrooms)
            .child(classroom.id)
            .child(Constants.children)
            .child(child.id)
            .child(Constants.checkedIn)
            .setValue(checkedIn)
    }

    func move(
        child: Child,
        from sourceClassroom: Classroom,
        to targetClassroom: Classroom,
        completion: @escaping () -> Void
    ) {
        let sourceClassroomRef = databaseReference
            .child(Constants.data)
            .child(Constants.center)
            .child(Constants.classrooms)
            .child(sourceClassroom.id)

        let targetClassroomRef = databaseReference
            .child(Constants.data)
            .child(Constants.center)
            .child(Constants.classrooms)
            .child(targetClassroom.id)

        targetClassroomRef.child(Constants.children).childByAutoId().setValue(child.toDictionary()) { error, _ in
            if error == nil {
                sourceClassroomRef.child(Constants.children).child(child.id).removeValue { error, _ in
                    if error == nil {
                        completion()
                    }
                }
            }
        }
    }
}
