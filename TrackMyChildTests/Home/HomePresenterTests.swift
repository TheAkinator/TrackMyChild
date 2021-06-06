//
//  HomePresenterTests.swift
//  TrackMyChildTests
//
//  Created by RAirApps on 06/06/21.
//

@testable import TrackMyChild
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
final class HomePresenterTests: XCTestCase {
    private var sut: HomePresenter!
    private var coordinator: HomeCoordinatorMock!
    private var trackMyChildAPI: TrackMyChildAPIMock!
    private var storage: StorageMock!
    private var view: HomeViewControllerMock!

    override func setUp() {
        super.setUp()
        coordinator = HomeCoordinatorMock()
        trackMyChildAPI = TrackMyChildAPIMock()
        storage = StorageMock()
        view = HomeViewControllerMock()
        sut = HomePresenter(coordinator: coordinator, trackMyChildAPI: trackMyChildAPI, storage: storage)
        sut.view = view
    }

    override func tearDown() {
        sut = nil
        coordinator = nil
        storage = nil
        trackMyChildAPI = nil
        view = nil
        super.tearDown()
    }

    func testFetchClassrooms_teacher0_succeed() {
        let viewExpectation = expectation(description: "viewExpectation")
        storage.teacher = trackMyChildAPI.teacher0

        // Check if view methods were called
        view.reachedDidFetchClassrooms = {
            viewExpectation.fulfill()
        }

        sut.fetchClassrooms()

        XCTAssertEqual(sut.classrooms.count, 2, "Number of classrooms should be 2")

        let expectedClassrooms = [trackMyChildAPI.classroom0, trackMyChildAPI.classroom1]
        XCTAssertEqual(sut.classrooms, expectedClassrooms, "Classrooms shoudld be equal to expectedClassrooms")

        wait(for: [viewExpectation], timeout: 0.1)
    }

    func testFetchClassrooms_teacher1_fails() {
        let viewExpectation = expectation(description: "viewExpectation")
        storage.teacher = trackMyChildAPI.teacher1

        // Check if view methods were called
        view.reachedDidFetchClassrooms = {
            viewExpectation.fulfill()
        }

        sut.fetchClassrooms()

        XCTAssertEqual(sut.classrooms.count, 0, "Number of classrooms should be 0")

        wait(for: [viewExpectation], timeout: 0.1)
    }

    func testDidPressCell_row0section0_callCoordinator() {
        sut.classrooms = [trackMyChildAPI.classroom0]

        // Check if coordinator methods were called
        coordinator.didNavigateToChildren = { currentClassroom, allClassrooms in
            XCTAssertEqual(allClassrooms, self.sut.classrooms, "Classrooms shoudld be equal to expectedClassrooms")
            XCTAssertEqual(currentClassroom, self.trackMyChildAPI.classroom0, "Classroom shoudld be equal to classroom0")
        }

        sut.didPressCellAt(indexPath: IndexPath(row: 0, section: 0))
    }

    func testLogout_callCoordinatorAndTeacherNil() {
        let coordinatorExpectation = expectation(description: "coordinatorExpectation")

        // Check if coordinator methods were called
        coordinator.didCallFinish = {
            coordinatorExpectation.fulfill()
        }

        sut.logout()

        XCTAssertNil(storage.teacher, "Teacher should be nil")
        wait(for: [coordinatorExpectation], timeout: 0.1)
    }
}
