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
    func didPressCellAt(indexPath: IndexPath)
    func logout()
}

final class HomePresenter: HomePresenterProtocol {
    weak var coordinator: HomeCoordinatorProtocol?
    weak var view: HomeViewProtocol?
    private let trackMyChildAPI: TrackMyChildAPIProtocol
    private var storage: KeyValueStorageProtocol
    var classrooms: [Classroom] = []

    init(
        coordinator: HomeCoordinatorProtocol,
        trackMyChildAPI: TrackMyChildAPIProtocol = TrackMyChildAPI(),
        storage: KeyValueStorageProtocol = KeyValueStorage()
    ) {
        self.coordinator = coordinator
        self.trackMyChildAPI = trackMyChildAPI
        self.storage = storage
    }

    func fetchClassrooms() {
        guard let teacher = storage.teacher else { return }
        trackMyChildAPI.fetchClassrooms(classroomsId: teacher.classrooms) { [weak self] result in
            switch result {
            case .success(let classrooms):
                self?.classrooms = classrooms
                self?.view?.didFetchClassrooms()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func didPressCellAt(indexPath: IndexPath) {
        let classroom = classrooms[indexPath.row]
        coordinator?.navigateToChildren(with: classroom, allClassrooms: classrooms)
    }

    func logout() {
        storage.teacher = nil
        coordinator?.finish()
    }
}
