//
//  TrackListViewController.swift
//  Audio Player
//
//  Created by Дмитрий Скок on 01.12.2023.
//

import UIKit

final class TrackListViewController: UIViewController {
    // MARK: - Views

    @IBOutlet var table: UITableView!

    // MARK: - Private properties

    private let viewModel: TrackListViewModel

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

        setupTable()
    }

    // MARK: - Private functions

    private func setupTable() {
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "TrackListTableViewCell", bundle: nil),
                       forCellReuseIdentifier: "cell"
        )
    }
}

// MARK: - UITableViewDataSource

extension TrackListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TrackListTableViewCell else {
            return UITableViewCell()
        }

        let track = viewModel.tracks[indexPath.row]
        cell.configureCell(track)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
}

// MARK: - UITableViewDelegate

extension TrackListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
