//
//  ChildrenPresenter.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import UIKit

protocol ChildrenPresenterProtocol {
    var classroomName: String { get }
    var classroomsToMoveIn: [Classroom] { get }
    var children: [Child] { get }

    func toogleCheckInFor(child: Child)
    func move(child: Child, to classroom: Classroom)
}

final class ChildrenPresenter: ChildrenPresenterProtocol {
    weak var coordinator: ChildrenCoordinatorProtocol?
    weak var view: ChildrenViewProtocol?
    private let trackMyChildAPI: TrackMyChildAPIProtocol
    private var currentClassroom: Classroom
    private var allClassrooms: [Classroom]

    init(
        coordinator: ChildrenCoordinatorProtocol,
        currentClassroom: Classroom,
        allClassrooms: [Classroom],
        trackMyChildAPI: TrackMyChildAPIProtocol = TrackMyChildAPI()
    ) {
        self.coordinator = coordinator
        self.currentClassroom = currentClassroom
        self.allClassrooms = allClassrooms
        self.trackMyChildAPI = trackMyChildAPI
    }

    var classroomName: String {
        currentClassroom.name
    }

    var children: [Child] {
        currentClassroom.children ?? []
    }

    var classroomsToMoveIn: [Classroom] {
        allClassrooms.filter { $0.id != currentClassroom.id }
    }

    func toogleCheckInFor(child: Child) {
        let checkedIn = child.checkedIn
        trackMyChildAPI.setCheckInTo(checkedIn, for: child, in: currentClassroom)
    }

    func move(child: Child, to classroom: Classroom) {
        trackMyChildAPI.move(child: child, from: currentClassroom, to: classroom) {
            self.currentClassroom.children = self.currentClassroom.children?.filter { $0.id != child.id }
            self.view?.didMoveChild()
        }
    }
}
