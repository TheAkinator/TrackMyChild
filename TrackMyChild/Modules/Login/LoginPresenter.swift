//
//  LoginPresenter.swift
//  TrackMyChild
//
//  Created by RAirApps on 06/06/21.
//

import Foundation

protocol LoginPresenterProtocol {
    func login(with id: String)
}

final class LoginPresenter: LoginPresenterProtocol {
    weak var coordinator: LoginCoordinatorProtocol?
    weak var view: LoginViewProtocol?
    private let trackMyChildAPI: TrackMyChildAPIProtocol
    private var storage: KeyValueStorageProtocol

    init(
        coordinator: LoginCoordinatorProtocol,
        trackMyChildAPI: TrackMyChildAPIProtocol = TrackMyChildAPI(),
        storage: KeyValueStorageProtocol = KeyValueStorage()
    ) {
        self.coordinator = coordinator
        self.trackMyChildAPI = trackMyChildAPI
        self.storage = storage
    }

    func login(with id: String) {
        trackMyChildAPI.fetchTeacherInfosFor(id: id) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let teacher):
                    self?.view?.didFinishLogin()
                    self?.storage.teacher = teacher
                    self?.coordinator?.navigateToHome()
                case .failure:
                    self?.view?.didFailLogin()
                }
            }
        }
    }
}
