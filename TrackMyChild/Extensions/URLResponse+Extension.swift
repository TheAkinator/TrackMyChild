//
//  URLResponse+Extension.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import Foundation

extension URLResponse {
    var isSuccessResponse: Bool {
        if let response = self as? HTTPURLResponse, (200...299).contains(response.statusCode) {
            return true
        }
        return false
    }
}
