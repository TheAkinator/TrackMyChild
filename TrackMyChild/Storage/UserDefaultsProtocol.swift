//
//  UserDefaultsProtocol.swift
//  TrackMyChild
//
//  Created by RAirApps on 06/06/21.
//

import Foundation

protocol UserDefaultsProtocol {
    func object(forKey defaultName: String) -> Any?
    func set(_ value: Any?, forKey defaultName: String)
    func removeObject(forKey defaultName: String)
}

extension UserDefaultsProtocol {
    func string(forKey key: String, defaulValue: String = "") -> String {
        object(forKey: key) as? String ?? defaulValue
    }
}

extension UserDefaults: UserDefaultsProtocol {}
