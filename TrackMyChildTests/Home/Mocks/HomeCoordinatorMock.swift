//
//  HomeCoordinatorMock.swift
//  TrackMyChildTests
//
//  Created by RAirApps on 06/06/21.
//

@testable import TrackMyChild

final class HomeCoordinatorMock: BasicCoordinator, HomeCoordinatorProtocol {
    var didNavigateToChildren: ((_ classroom: Classroom, _ allClassrooms: [Classroom]) -> Void)?
    var didCallFinish: (() -> Void)?

    func navigateToChildren(with selectedClassroom: Classroom, allClassrooms: [Classroom]) {
        didNavigateToChildren?(selectedClassroom, allClassrooms)
    }

    override func finish() {
        didCallFinish?()
    }
}
