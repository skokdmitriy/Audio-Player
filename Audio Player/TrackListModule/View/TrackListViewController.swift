//
//  TrackListViewController.swift
//  Audio Player
//
//  Created by Дмитрий Скок on 01.12.2023.
//

import UIKit

final class TrackListViewController: UIViewController {
    // MARK: - Views

    private lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(TrackListTableViewCell.self,
                           forCellReuseIdentifier: Constants.cellIdentifier)
        tableview.backgroundColor = .white
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()

    // MARK: - Private properties

    private var viewModel: TrackListViewModel

    // MARK: - Initialization

    init(viewModel: TrackListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureLayout()
        configure()
    }

    // MARK: - Private functions

    private func configure() {
        title = Title.titleMain
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func configureLayout() {
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

// MARK: - UITableViewDataSource

extension TrackListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tracks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier,
                                                       for: indexPath
        ) as? TrackListTableViewCell else {
            return UITableViewCell()
        }
        let track = viewModel.tracks[indexPath.row]
        cell.configureCell(track)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.heightForRow
    }
}

// MARK: - UITableViewDelegate

extension TrackListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.tapOnTrack(indexPath: indexPath)
    }
}
