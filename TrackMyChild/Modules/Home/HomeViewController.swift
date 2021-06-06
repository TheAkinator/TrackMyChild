//
//  HomeViewController.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func didFetchClassrooms()
}

final class HomeViewController: BaseViewController {
    private enum Constants {
        static let title = "Classrooms"
    }

    private var presenter: HomePresenterProtocol

    private lazy var tableView: UITableView = {
        var tableView: UITableView
        if #available(iOS 13.0, *) {
            tableView = UITableView(frame: .zero, style: .insetGrouped)
        } else {
            tableView = UITableView(frame: .zero, style: .grouped)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(ClassroomCell.self)
        return tableView
    }()

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .gray
        indicator.startAnimating()
        return indicator
    }()

    private lazy var logoutButton: UIBarButtonItem = {
        UIBarButtonItem(title: "logout", style: .plain, target: self, action: #selector(didPressLogout))
    }()

    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
        presenter.fetchClassrooms()
    }

    private func setupNavigationBar() {
        title = Constants.title
        navigationItem.leftBarButtonItem = logoutButton
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupViews() {
        view.addSubview(tableView)
        tableView.topAnchor(equalTo: view.topAnchor)
        tableView.leadingAnchor(equalTo: view.safeLeadingAnchor)
        tableView.bottomAnchor(equalTo: view.bottomAnchor)
        tableView.trailingAnchor(equalTo: view.safeTrailingAnchor)

        view .addSubview(activityIndicator)
        activityIndicator.centerVertical(equalTo: view.centerYAnchor)
        activityIndicator.centerHorizontal(equalTo: view.centerXAnchor)
    }

    @objc private func didPressLogout() {
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.classrooms.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ClassroomCell
        let classroom = presenter.classrooms[indexPath.row]
        cell.presenter = ClassroomCellPresenter(classroom: classroom)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didPressCellAt(indexPath: indexPath)
    }
}

extension HomeViewController: HomeViewProtocol {
    func didFetchClassrooms() {
        tableView.reloadData()
        activityIndicator.stopAnimating()
    }
}
