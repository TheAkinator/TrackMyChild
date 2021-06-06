//
//  HomeCoordinator.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import UIKit

protocol HomeCoordinatorProtocol: BasicCoordinator {
    func navigateToChildren(with selectedClassroom: Classroom, allClassrooms: [Classroom])
}

final class HomeCoordinator: BasicCoordinator, HomeCoordinatorProtocol {
    private var currentNavigationController: UINavigationController?

    override func start() {
        let presenter = HomePresenter(coordinator: self)
        let viewController = HomeViewController(presenter: presenter)
        presenter.view = viewController
        let navigation = UINavigationController(rootViewController: viewController)
        navigation.modalPresentationStyle = .fullScreen
        currentNavigationController = navigation
        navigationController.present(navigation, animated: true, completion: nil)
    }

    func navigateToChildren(with selectedClassroom: Classroom, allClassrooms: [Classroom]) {
        guard let currentNavigationController = currentNavigationController else { return }
        let coordinator = ChildrenCoordinator(
            navigationController: currentNavigationController,
            currentClassroom: selectedClassroom,
            allClassrooms: allClassrooms
        )
        start(coordinator: coordinator)
    }
}
