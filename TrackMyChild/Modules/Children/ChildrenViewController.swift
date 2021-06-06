//
//  ChildrenViewController.swift
//  TrackMyChild
//
//  Created by RAirApps on 05/06/21.
//

import UIKit

protocol ChildrenViewProtocol: AnyObject {
    func didMoveChild()
}

final class ChildrenViewController: BaseViewController {
    private enum Constants {
    }

    private var presenter: ChildrenPresenterProtocol

    private lazy var tableView: UITableView = {
        var tableView: UITableView
        if #available(iOS 13.0, *) {
            tableView = UITableView(frame: .zero, style: .insetGrouped)
        } else {
            tableView = UITableView(frame: .zero, style: .grouped)
        }
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
        title = presenter.classroomName
    }

    private func setupViews() {
        view.addSubview(tableView)
        tableView.topAnchor(equalTo: view.topAnchor)
        tableView.leadingAnchor(equalTo: view.leadingAnchor)
        tableView.bottomAnchor(equalTo: view.bottomAnchor)
        tableView.trailingAnchor(equalTo: view.trailingAnchor)
    }

    private func presentMoveChildActionSheet(child: Child) {
        let actionSheet = UIAlertController(title: "Move \(child.fullName) to:", message: "", preferredStyle: .actionSheet)
        presenter.classroomsToMoveIn.forEach { classroom in
            let action = UIAlertAction(title: classroom.name, style: .default) { _ in
                self.presenter.move(child: child, to: classroom)
            }
            actionSheet.addAction(action)
        }
        present(actionSheet, animated: true, completion: nil)
    }
}

extension ChildrenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.children.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ChildCell
        let child = presenter.children[indexPath.row]
        cell.presenter = presenter
        cell.child = child
        cell.moreButtonAction = { child in
            self.presentMoveChildActionSheet(child: child)
        }
        return cell
    }
}

extension ChildrenViewController: ChildrenViewProtocol {
    func didMoveChild() {
        tableView.reloadData()
    }
}
