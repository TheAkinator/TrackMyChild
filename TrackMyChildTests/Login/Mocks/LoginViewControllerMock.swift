//
//  LoginViewControllerMock.swift
//  TrackMyChildTests
//
//  Created by RAirApps on 06/06/21.
//

@testable import TrackMyChild

final class LoginViewControllerMock: LoginViewProtocol {
    var reachedDidFailLogin: (() -> Void)?
    var reachedDidFinishLogin: (() -> Void)?
    
    func didFailLogin() {
        reachedDidFailLogin?()
    }

    func didFinishLogin() {
        reachedDidFinishLogin?()
    }
}
