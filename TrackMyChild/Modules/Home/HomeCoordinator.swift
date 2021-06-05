//
//  HomeCoordinator.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import UIKit

protocol HomeCoordinatorProtocol: BasicCoordinator {
    func navigateToChildren(with children: [Child])
}

final class HomeCoordinator: BasicCoordinator, HomeCoordinatorProtocol {
    private var window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    override func start() {
        let presenter = HomePresenter(coordinator: self)
        let viewController = HomeViewController(presenter: presenter)
        presenter.view = viewController
        navigationController.viewControllers = [viewController]

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    func navigateToChildren(with children: [Child]) {
        let coordinator = ChildrenCoordinator(children: children)
        start(coordinator: coordinator)
    }
}
