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
        time()
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

    func time () {
        let interval = CMTime(value: 1, timescale: 1000)
        player.player?.addPeriodicTimeObserver(forInterval: interval,
                                               queue: DispatchQueue.main
        ) { [weak self] time in
            guard let self else {
                return
            }
            let minutes = time.seconds / 60
            let seconds = Int(time.seconds) % 60
            let minutesString = String(format: "%02d", Int(minutes))
            let secondsString = String(format: "%02d", Int(seconds))
            self.playerView.currentTimeLabel.text = "\(minutesString):\(secondsString)"

            if let duration = player.player?.currentItem?.duration {
                let durationSeconds = CMTimeGetSeconds(duration)
                let progressSeconds = CMTimeGetSeconds(time)
                let progress = Float(progressSeconds / durationSeconds)
                self.playerView.trackProgress.progress = progress
            }
        }
    }
}
