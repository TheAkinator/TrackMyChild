//
//  StorageMock.swift
//  TrackMyChildTests
//
//  Created by RAirApps on 06/06/21.
//

@testable import TrackMyChild

final class StorageMock: KeyValueStorageProtocol {
    var didSetTeacher: (() -> Void)?
    var teacher: Teacher? {
        didSet {
            didSetTeacher?()
        }
    }
}
