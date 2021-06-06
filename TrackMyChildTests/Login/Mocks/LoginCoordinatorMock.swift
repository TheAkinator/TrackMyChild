//
//  LoginCoordinatorMock.swift
//  TrackMyChildTests
//
//  Created by RAirApps on 06/06/21.
//

@testable import TrackMyChild

final class LoginCoordinatorMock: BasicCoordinator, LoginCoordinatorProtocol {
    var didNavigateToHome: (() -> Void)?

    func navigateToHome() {
        didNavigateToHome?()
    }
}
