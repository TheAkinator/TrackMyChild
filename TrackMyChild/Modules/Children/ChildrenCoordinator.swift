//
//  ChildrenCoordinator.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import UIKit

final class ChildrenCoordinator: BasicCoordinator {
    private let children: [Child]

    init(children: [Child]) {
        self.children = children
    }

    override func start() {
        let presenter = ChildrenPresenter(coordinator: self, children: children)
        let viewController = ChildrenViewController(presenter: presenter)
        navigationController.delegate = self
        navigationController.pushViewController(viewController, animated: true)
    }
}
