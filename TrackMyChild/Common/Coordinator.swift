//
//  Coordinator.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }

    func start()
    func finish()

    func start(coordinator: Coordinator)
    func finish(coordinator: Coordinator)
}

class BasicCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController = UINavigationController()

    func start() {
        fatalError("Start method must be implemented")
    }

    func finish() {
        parentCoordinator?.finish(coordinator: self)
        // In case it was presented
        if navigationController.presentedViewController != nil {
            navigationController.dismiss(animated: true, completion: nil)
            return
        }
        // In case it was pushed
        navigationController.popViewController(animated: true)
    }

    func start(coordinator: Coordinator) {
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.navigationController = navigationController
        coordinator.start()
    }

    func finish(coordinator: Coordinator) {
        let coordinatorIndex = childCoordinators.firstIndex { $0 === coordinator }
        guard let index = coordinatorIndex else { return }
        childCoordinators.remove(at: index)
    }
}

extension BasicCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let dismissedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
              !navigationController.viewControllers.contains(dismissedViewController) else {
                return
            }
        parentCoordinator?.finish(coordinator: self)
    }
}
