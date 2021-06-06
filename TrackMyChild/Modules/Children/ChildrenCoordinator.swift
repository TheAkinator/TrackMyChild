//
//  ChildrenCoordinator.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import UIKit

protocol ChildrenCoordinatorProtocol: BasicCoordinator { }

final class ChildrenCoordinator: BasicCoordinator, ChildrenCoordinatorProtocol {
    private let currentClassroom: Classroom
    private let allClassrooms: [Classroom]
    private let currentnavigationController: UINavigationController

    init(
        navigationController: UINavigationController,
        currentClassroom: Classroom,
        allClassrooms: [Classroom]
    ) {
        self.currentClassroom = currentClassroom
        self.allClassrooms = allClassrooms
        self.currentnavigationController = navigationController
    }

    override func start() {
        let presenter = ChildrenPresenter(coordinator: self, currentClassroom: currentClassroom, allClassrooms: allClassrooms)
        let viewController = ChildrenViewController(presenter: presenter)
        presenter.view = viewController
        currentnavigationController.delegate = self
        currentnavigationController.pushViewController(viewController, animated: true)
    }
}
