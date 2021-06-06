//
//  LoginCoordinator.swift
//  TrackMyChild
//
//  Created by RAirApps on 06/06/21.
//

import UIKit

protocol LoginCoordinatorProtocol: BasicCoordinator {
    func navigateToHome()
}

final class LoginCoordinator: BasicCoordinator, LoginCoordinatorProtocol {
    private var window: UIWindow
    private var storage: KeyValueStorageProtocol

    init(
        window: UIWindow,
        storage: KeyValueStorageProtocol = KeyValueStorage()
    ) {
        self.window = window
        self.storage = storage
    }

    override func start() {
        let presenter = LoginPresenter(coordinator: self)
        let viewController = LoginViewController(presenter: presenter)
        presenter.view = viewController
        navigationController.viewControllers = [viewController]

        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        if storage.teacher != nil {
            navigateToHome()
        }
    }

    func navigateToHome() {
        let coordinator = HomeCoordinator()
        start(coordinator: coordinator)
    }
}
