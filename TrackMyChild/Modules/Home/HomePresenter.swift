//
//  HomePresenter.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import UIKit

protocol HomePresenterProtocol {
    var classrooms: [Classroom] { get }
    func fetchClassrooms()
}

final class HomePresenter: HomePresenterProtocol {
    weak var coordinator: HomeCoordinator?
    weak var view: HomeViewProtocol?
    private let trackMyChildAPI: TrackMyChildAPIProtocol
    var classrooms: [Classroom] = []

    init(
        coordinator: HomeCoordinator,
        trackMyChildAPI: TrackMyChildAPIProtocol = TrackMyChildAPI()
    ) {
        self.coordinator = coordinator
        self.trackMyChildAPI = trackMyChildAPI
    }

    func fetchClassrooms() {
        trackMyChildAPI.getClassrooms { [weak self] result in
            switch result {
            case .success(let classrooms):
                self?.classrooms = classrooms
                self?.view?.didFetchClassrooms()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
