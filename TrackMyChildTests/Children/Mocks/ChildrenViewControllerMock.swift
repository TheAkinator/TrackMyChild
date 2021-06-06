//
//  ChildrenViewControllerMock.swift
//  TrackMyChildTests
//
//  Created by RAirApps on 06/06/21.
//

@testable import TrackMyChild

final class ChildrenViewControllerMock: ChildrenViewProtocol {
    var reachedDidMoveChild: (() -> Void)?

    func didMoveChild() {
        reachedDidMoveChild?()
    }
}
