//
//  LoginViewController.swift
//  TrackMyChild
//
//  Created by RAirApps on 06/06/21.
//

import UIKit

protocol LoginViewProtocol: AnyObject {
    func didFailLogin()
    func didFinishLogin()
}

final class LoginViewController: BaseViewController {
    private enum Constants {
        static let title = "Track My Child"
        static let details = "Enter yout teacher's ID to login"
        static let teacherID = "Teacher's ID"
        static let login = "Login"
        static let failedLogin = "Login failed"
        static let failedLoginMessage = "Your teacher's ID is probably wrong."
    }

    private var presenter: LoginPresenterProtocol

    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = Images.background
        imageView.alpha = 0.8
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 40)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.text = Constants.title
        return label
    }()

    private lazy var detailsLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.text = Constants.details
        label.numberOfLines = 0
        return label
    }()

    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 16, weight: .semibold)
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .done
        textField.autocapitalizationType = .none
        textField.delegate = self
        textField.placeholder = Constants.teacherID
        return textField
    }()

    private lazy var loginButton: HighlitableButton = {
        let button = HighlitableButton()
        button.backgroundColor = Colors.softYellow
        button.setTitle(Constants.login, for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(didPressLogin), for: .touchUpInside)
        return button
    }()

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .gray
        return indicator
    }()

    init(presenter: LoginPresenterProtocol) {
        self.presenter = presenter
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }

    private func setupViews() {
        view.addSubviews(backgroundImage, titleLabel, detailsLabel, textField, loginButton, activityIndicator)

        backgroundImage.topAnchor(equalTo: view.topAnchor)
        backgroundImage.leadingAnchor(equalTo: view.leadingAnchor)
        backgroundImage.bottomAnchor(equalTo: view.bottomAnchor)
        backgroundImage.trailingAnchor(equalTo: view.trailingAnchor)

        textField.centerVertical(equalTo: view.centerYAnchor)
        textField.heightAnchor(equalTo: 40)
        textField.leadingAnchor(equalTo: view.leadingAnchor, constant: 40)
        textField.trailingAnchor(equalTo: view.trailingAnchor, constant: 40)

        titleLabel.bottomAnchor(equalTo: detailsLabel.topAnchor, constant: 100)
        titleLabel.leadingAnchor(equalTo: view.leadingAnchor)
        titleLabel.trailingAnchor(equalTo: view.trailingAnchor)

        detailsLabel.bottomAnchor(equalTo: textField.topAnchor, constant: 10)
        detailsLabel.leadingAnchor(equalTo: textField.leadingAnchor)
        detailsLabel.trailingAnchor(equalTo: textField.trailingAnchor)

        loginButton.topAnchor(equalTo: textField.bottomAnchor, constant: 20)
        loginButton.leadingAnchor(equalTo: textField.leadingAnchor)
        loginButton.trailingAnchor(equalTo: textField.trailingAnchor)
        loginButton.heightAnchor(equalTo: 50)

        activityIndicator.centerVertical(equalTo: loginButton.centerYAnchor)
        activityIndicator.centerHorizontal(equalTo: loginButton.centerXAnchor)
    }

    @objc private func didPressLogin() {
        guard let id = textField.text, !id.isEmpty else { return }
        loginButton.setTitle("", for: .normal)
        activityIndicator.startAnimating()
        textField.resignFirstResponder()
        presenter.login(with: id)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension LoginViewController: LoginViewProtocol {
    func didFinishLogin() {
        activityIndicator.stopAnimating()
        loginButton.setTitle(Constants.login, for: .normal)
        textField.text = ""
    }

    func didFailLogin() {
        activityIndicator.stopAnimating()
        loginButton.setTitle(Constants.login, for: .normal)
        showAlert(withTitle: Constants.failedLogin, andMessage: Constants.failedLoginMessage)
    }
}
