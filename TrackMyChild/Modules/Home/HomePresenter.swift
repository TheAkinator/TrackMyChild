//
//  HomePresenter.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import UIKit

protocol HomePresenterProtocol {
}

final class HomePresenter: HomePresenterProtocol {
    weak var coordinator: HomeCoordinator?

    init(
        coordinator: HomeCoordinator
    ) {
        self.coordinator = coordinator
    }
}
