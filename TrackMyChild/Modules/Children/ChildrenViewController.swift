//
//  ChildrenViewController.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import UIKit

protocol ChildrenViewProtocol: AnyObject {
    func didFetchClassrooms()
}

final class ChildrenViewController: BaseViewController {
    private enum Constants {
        static let title = "Children"
    }

    private var presenter: ChildrenPresenterProtocol

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
        tableView.register(ChildCell.self)
        return tableView
    }()

    init(presenter: ChildrenPresenterProtocol) {
        self.presenter = presenter
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
    }

    private func setupNavigationBar() {
        title = Constants.title
    }

    private func setupViews() {
        view.addSubview(tableView)
        tableView.topAnchor(equalTo: view.topAnchor)
        tableView.leadingAnchor(equalTo: view.leadingAnchor)
        tableView.bottomAnchor(equalTo: view.bottomAnchor)
        tableView.trailingAnchor(equalTo: view.trailingAnchor)
    }

    @objc private func didPressLogout() {
    }
}

extension ChildrenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.children.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ChildCell
        let child = presenter.children[indexPath.row]
        cell.child = child
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as? ChildCell
        cell?.toggleCheckIn()
    }
}

extension ChildrenViewController: HomeViewProtocol {
    func didFetchClassrooms() {
        tableView.reloadData()
    }
}
