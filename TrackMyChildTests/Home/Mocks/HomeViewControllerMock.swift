//
//  HomeViewControllerMock.swift
//  TrackMyChildTests
//
//  Created by RAirApps on 06/06/21.
//

@testable import TrackMyChild

final class HomeViewControllerMock: HomeViewProtocol {
    var reachedDidFetchClassrooms: (() -> Void)?

    func didFetchClassrooms() {
        reachedDidFetchClassrooms?()
    }
}
