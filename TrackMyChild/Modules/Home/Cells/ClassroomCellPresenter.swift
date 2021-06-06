//
//  ClassroomCellPresenter.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import UIKit

protocol ClassroomCellPresenterProtocol {
    var classroomName: String { get }
    func fetchImage(completion: @escaping (Result<Data, RequestError>) -> Void)
}

final class ClassroomCellPresenter: ClassroomCellPresenterProtocol {
    private let classroom: Classroom
    private let imageFetcher: ImageFetcherProtocol

    init(
        classroom: Classroom,
        imageFetcher: ImageFetcherProtocol = ImageFetcher()
    ) {
        self.classroom = classroom
        self.imageFetcher = imageFetcher
    }

    var classroomName: String {
        classroom.name
    }

    func fetchImage(completion: @escaping (Result<Data, RequestError>) -> Void) {
        guard let icon = classroom.icon,
            let url = URL(string: icon)
        else {
            return
        }
        imageFetcher.fetchImage(at: url, completion: completion)
    }
}
