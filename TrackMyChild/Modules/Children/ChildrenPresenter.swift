//
//  ChildrenPresenter.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import UIKit

protocol ChildrenPresenterProtocol {
    var children: [Child] { get }
    func toogleCheckInFor(indexPath: IndexPath)
}

final class ChildrenPresenter: ChildrenPresenterProtocol {
    weak var coordinator: ChildrenCoordinator?
    weak var view: ChildrenViewProtocol?
    private let trackMyChildAPI: TrackMyChildAPIProtocol
    var classroom: Classroom

    init(
        coordinator: ChildrenCoordinator,
        classroom: Classroom,
        trackMyChildAPI: TrackMyChildAPIProtocol = TrackMyChildAPI()
    ) {
        self.coordinator = coordinator
        self.classroom = classroom
        self.trackMyChildAPI = trackMyChildAPI
    }

    var children: [Child] {
        classroom.children
    }

    func toogleCheckInFor(indexPath: IndexPath) {
        classroom.children[indexPath.row].checkedIn.toggle()
        let child = classroom.children[indexPath.row]
        trackMyChildAPI.setCheckInTo(child.checkedIn, for: child, in: classroom)
    }
}
