//
//  PlayerViewController.swift
//  Audio Player
//
//  Created by Дмитрий Скок on 02.12.2023.
//

import UIKit
import AVFoundation

final class PlayerViewController: UIViewController {
    // MARK: - Private properties

    private lazy var playerView = PlayerView()
    private let player = AudioPlayerService.shared
    private let viewModel: PlayerViewModel
    private var trackTimer: Timer?

    // MARK: - Initialization

    init(viewModel: PlayerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func loadView() {
        super.loadView()

        view = playerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        playTrack(index: viewModel.currentTrackIndex)
        createTimer()
    }

    private func playTrack(index: Int) {
        player.playTrack(currentTrackIndex: index)
        player.currentTrackIndex = index
    }

    // MARK: - Private methods

    private func configure() {
        view.backgroundColor = .white
        playerView.artistLabel.text = viewModel.track.artist
        playerView.titleLabel.text = viewModel.track.title
        playerView.durationTimeLabel.text = viewModel.track.duration
    }

    private func createTimer() {
        trackTimer = Timer.scheduledTimer(timeInterval: 0.1,
                             target: self,
                             selector: #selector(updateProgressView),
                             userInfo: nil,
                             repeats: true
        )
    }

    @objc private func updateProgressView() {
        let totalTime = player.durationTrack
        let progress = Float(0.1 / totalTime)
        playerView.trackProgress.progress += progress
    }
}
