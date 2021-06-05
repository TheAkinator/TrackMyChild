//
//  HomeViewController.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import UIKit

final class HomeViewController: BaseViewController {
    private var presenter: HomePresenterProtocol

    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}
