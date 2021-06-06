//
//  LoginPresenterTests.swift
//  TrackMyChildTests
//
//  Created by RAirApps on 06/06/21.
//

@testable import TrackMyChild
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
final class LoginPresenterTests: XCTestCase {
    private var sut: LoginPresenter!
    private var coordinator: LoginCoordinatorMock!
    private var trackMyChildAPI: TrackMyChildAPIMock!
    private var storage: StorageMock!
    private var view: LoginViewControllerMock!

    override func setUp() {
        super.setUp()
        coordinator = LoginCoordinatorMock()
        trackMyChildAPI = TrackMyChildAPIMock()
        storage = StorageMock()
        view = LoginViewControllerMock()
        sut = LoginPresenter(coordinator: coordinator, trackMyChildAPI: trackMyChildAPI, storage: storage)
        sut.view = view
    }

    func testLogin_teacher0_succeed() {
        let viewExpectation = expectation(description: "viewExpectation")
        let coordinatorExpectation = expectation(description: "coordinatorExpectation")

        // Check if view methods were called
        view.reachedDidFinishLogin = {
            viewExpectation.fulfill()
        }

        // Check if coordinator methods were called
        coordinator.didNavigateToHome = {
            coordinatorExpectation.fulfill()
        }

        // Check if storage contains the fetched teacher
        storage.didSetTeacher = {
            XCTAssertEqual(self.storage.teacher?.id, self.trackMyChildAPI.teacher.id, "Id is not the same")
            XCTAssertEqual(self.storage.teacher?.name, self.trackMyChildAPI.teacher.name, "Name is not the same")
            XCTAssertEqual(self.storage.teacher?.classrooms, self.trackMyChildAPI.teacher.classrooms, "Classrooms are not the same")
        }

        sut.login(with: "teacher-0")

        wait(for: [viewExpectation, coordinatorExpectation], timeout: 0.1)
    }

    func testLogin_teacher1_fails() {
        let viewExpectation = expectation(description: "viewExpectation")

        // Check if view methods were called
        view.reachedDidFailLogin = {
            viewExpectation.fulfill()
        }

        sut.login(with: "teacher-1")

        wait(for: [viewExpectation], timeout: 0.1)
    }
}
