//
//  ChildrenPresenterTests.swift
//  TrackMyChildTests
//
//  Created by RAirApps on 06/06/21.
//

@testable import TrackMyChild
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
final class ChildrenPresenterTests: XCTestCase {
    private var sut: ChildrenPresenter!
    private var coordinator: ChildrenCoordinatorMock!
    private var trackMyChildAPI: TrackMyChildAPIMock!
    private var storage: StorageMock!
    private var view: ChildrenViewControllerMock!

    override func setUp() {
        super.setUp()
        trackMyChildAPI = TrackMyChildAPIMock()
        view = ChildrenViewControllerMock()
        coordinator = ChildrenCoordinatorMock()
        sut = ChildrenPresenter(
            coordinator: coordinator,
            currentClassroom: trackMyChildAPI.classroom0,
            allClassrooms: [trackMyChildAPI.classroom0, trackMyChildAPI.classroom1],
            trackMyChildAPI: trackMyChildAPI
        )
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

    func testClassroomName_ShouldBeEqualToClassroom0() {
        XCTAssertEqual(
            sut.classroomName,
            trackMyChildAPI.classroom0.name,
            "Classroom name should be equal to classroom0 name"
        )
    }

    func testChildren_ShouldBeEqualToClassroom0Children() {
        XCTAssertEqual(
            sut.children,
            trackMyChildAPI.classroom0.children,
            "Classroom children should be equal to classroom0 children"
        )
    }

    func testClassroomsToMoveIn_ShouldBeEqualToClassroom1() {
        XCTAssertEqual(
            sut.classroomsToMoveIn,
            [trackMyChildAPI.classroom1],
            "Classrooms To Move In should be equal to classroom1 array"
        )
    }

    func testToogleCheckIn() {
        let trackMyChildAPIExpectation = expectation(description: "trackMyChildAPIExpectation")
        guard let child = trackMyChildAPI.classroom0.children?.first else { return }

        trackMyChildAPI.didToogleCheckin = {
            trackMyChildAPIExpectation.fulfill()
        }

        sut.toogleCheckInFor(child: child)

        wait(for: [trackMyChildAPIExpectation], timeout: 0.1)
    }

    func testMoveChild() {
        let viewExpectation = expectation(description: "viewExpectation")
        guard let child = trackMyChildAPI.classroom0.children?.first else { return }

        view.reachedDidMoveChild = {
            viewExpectation.fulfill()
        }

        sut.move(child: child, to: trackMyChildAPI.classroom1)

        wait(for: [viewExpectation], timeout: 0.1)
    }
}
