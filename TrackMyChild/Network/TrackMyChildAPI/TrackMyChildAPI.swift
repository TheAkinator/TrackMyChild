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
}

final class TrackMyChildAPI: TrackMyChildAPIProtocol {
    private enum Constants {
        static let data = "data"
        static let center = "center"
        static let classrooms = "classrooms"
        static let children = "children"
        static let checkedIn = "checked_in"
    }

    private let databaseReference: DatabaseReference

    init(databaseReference: DatabaseReference = Database.database().reference()) {
        self.databaseReference = databaseReference
    }

    func fetchClassrooms(completion: @escaping (Result<[Classroom], Error>) -> Void) {
        databaseReference
            .child(Constants.data)
            .child(Constants.center)
            .child(Constants.classrooms)
            .observe(.value) { snapshot in
                guard let classroomsData = snapshot.value as? [[String: AnyObject]] else {
                    return
                }
                let classrooms = classroomsData.enumerated().compactMap { index, classroom in
                    Classroom(firebaseId: index, data: classroom)
                }
                completion(.success(classrooms))
            }
    }

    func setCheckInTo(_ checkedIn: Bool, for child: Child, in classroom: Classroom) {
        databaseReference
            .child(Constants.data)
            .child(Constants.center)
            .child(Constants.classrooms)
            .child(String(classroom.firebaseId))
            .child(Constants.children)
            .child(String(child.firebaseId))
            .child(Constants.checkedIn)
            .setValue(checkedIn)
    }
}
