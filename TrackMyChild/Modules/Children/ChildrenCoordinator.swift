//
//  ChildrenCoordinator.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import UIKit

final class ChildrenCoordinator: BasicCoordinator {
    private let currentClassroom: Classroom
    private let allClassrooms: [Classroom]

    init(currentClassroom: Classroom, allClassrooms: [Classroom]) {
        self.currentClassroom = currentClassroom
        self.allClassrooms = allClassrooms
    }

    override func start() {
        let presenter = ChildrenPresenter(coordinator: self, currentClassroom: currentClassroom, allClassrooms: allClassrooms)
        let viewController = ChildrenViewController(presenter: presenter)
        presenter.view = viewController
        navigationController.delegate = self
        navigationController.pushViewController(viewController, animated: true)
    }
}
