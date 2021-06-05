//
//  ChildrenPresenter.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import UIKit

protocol ChildrenPresenterProtocol {
    var children: [Child] { get }
//    func fetchClassrooms()
}

final class ChildrenPresenter: ChildrenPresenterProtocol {
    weak var coordinator: ChildrenCoordinator?
    weak var view: ChildrenViewProtocol?
    private let trackMyChildAPI: TrackMyChildAPIProtocol
    var children: [Child]

    init(
        coordinator: ChildrenCoordinator,
        children: [Child],
        trackMyChildAPI: TrackMyChildAPIProtocol = TrackMyChildAPI()
    ) {
        self.coordinator = coordinator
        self.children = children
        self.trackMyChildAPI = trackMyChildAPI
    }

//    func fetchClassrooms() {
//        trackMyChildAPI.getClassrooms { [weak self] result in
//            switch result {
//            case .success(let classrooms):
//                self?.classrooms = classrooms
//                self?.view?.didFetchClassrooms()
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
}
