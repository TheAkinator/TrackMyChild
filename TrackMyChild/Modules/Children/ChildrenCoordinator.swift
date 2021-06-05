//
//  ChildrenCoordinator.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import UIKit

final class ChildrenCoordinator: BasicCoordinator {
    private let classroom: Classroom

    init(classroom: Classroom) {
        self.classroom = classroom
    }

    override func start() {
        let presenter = ChildrenPresenter(coordinator: self, classroom: classroom)
        let viewController = ChildrenViewController(presenter: presenter)
        navigationController.delegate = self
        navigationController.pushViewController(viewController, animated: true)
    }
}
