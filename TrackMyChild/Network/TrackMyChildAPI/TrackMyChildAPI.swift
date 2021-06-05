//
//  TrackMyChildAPI.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import Firebase

protocol TrackMyChildAPIProtocol {
    func fetchClassrooms(completion: @escaping (Result<[Classroom], Error>) -> Void)
}

final class TrackMyChildAPI: TrackMyChildAPIProtocol {
    private enum Constants {
        static let data = "data"
        static let center = "center"
        static let classrooms = "classrooms"
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
                let classrooms = classroomsData.compactMap { Classroom(data: $0) }
                completion(.success(classrooms))
            }
    }
}
