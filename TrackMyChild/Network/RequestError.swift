//
//  RequestError.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import Foundation

enum RequestError: Error {
    case badURL
    case requestFailed(Int)
    case underlying(Error)
    case emptyResponse
    case invalidId
}
