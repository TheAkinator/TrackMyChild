//
//  DatabaseReferenceProtocol.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import Firebase

protocol DatabaseReferenceProtocol {
    func child(_ pathString: String) -> DatabaseReference
//    func observe(_ eventType: DataEventType, with block: (DataSnapshot) -> Void) -> UInt
}

extension DatabaseReference: DatabaseReferenceProtocol {}
