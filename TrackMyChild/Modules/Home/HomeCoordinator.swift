//
//  HomeCoordinator.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import UIKit

final class HomeCoordinator: BasicCoordinator {
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
}
