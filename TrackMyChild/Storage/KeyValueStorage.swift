//
//  KeyValueStorage.swift
//  TrackMyChild
//
//  Created by RAirApps on 06/06/21.
//

import UIKit

protocol KeyValueStorageProtocol {
    var teacher: Teacher? { get set }
}

final class KeyValueStorage: KeyValueStorageProtocol {
    private enum Constanst {
        static let teacherKey = "teacher"
    }
    static let shared = KeyValueStorage()
    private let userDefaults: UserDefaultsProtocol

    init(userDefaults: UserDefaultsProtocol = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }

    var teacher: Teacher? {
        get {
            guard
                let teacherData = userDefaults.object(forKey: Constanst.teacherKey) as? Data,
                let teacher = try? JSONDecoder().decode(Teacher.self, from: teacherData)
            else {
                return nil
            }
            return teacher
        }
        set {
            guard let encoded = try? JSONEncoder().encode(newValue) else { return }
            userDefaults.set(encoded, forKey: Constanst.teacherKey)
        }
    }
}
