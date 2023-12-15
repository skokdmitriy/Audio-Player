//
//  PlayerViewController.swift
//  Audio Player
//
//  Created by Дмитрий Скок on 02.12.2023.
//

import UIKit
import Combine

final class PlayerViewController: UIViewController {
    // MARK: - Private properties

    private lazy var playerView = PlayerView()
    private let playerService = PlayerService.shared
    private let viewModel: PlayerViewModel
    private var subscriptions = Set<AnyCancellable>()

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

        configureNavigationBar()
        configure()
        trackEnded()
        addTarget()
    }

    // MARK: - Private methods

    private func configureNavigationBar() {
        let closeButton = UIBarButtonItem(customView: playerView.closeButtonView)
        navigationItem.leftBarButtonItem = closeButton
    }

    private func configure() {
        binding()
        playerView.artistLabel.text = viewModel.track.artist
        playerView.titleLabel.text = viewModel.track.title
        playerView.durationTimeLabel.text = viewModel.track.duration
    }

    private func binding() {
        playerService.$currentTime
            .receive(on: DispatchQueue.main)
            .sink { currentTime in
                self.playerView.currentTimeLabel.text = currentTime
            }
            .store(in: &subscriptions)

        playerService.$progress
            .receive(on: DispatchQueue.main)
            .sink { progress in
                self.playerView.trackProgress.progress = progress ?? 0
            }
            .store(in: &subscriptions)
    }

    private func trackEnded() {
        playerService.isTrackEnded
            .sink { boolValue in
                if boolValue {
                    self.viewModel.nextTrack()
                    self.configure()
                }
            }
            .store(in: &subscriptions)
    }

    private func addTarget() {
        playerView.playButton.addTarget(self,
                                        action: #selector(didTapPlayButton),
                                        for: .touchUpInside
        )
        playerView.nextButton.addTarget(self,
                                        action: #selector(didTapNextButton),
                                        for: .touchUpInside
        )
        playerView.backButton.addTarget(self,
                                        action: #selector(didTapBackButton),
                                        for: .touchUpInside
        )
        playerView.closeButton.addTarget(self,
                                         action: #selector(didTapСloseButton),
                                         for: .touchUpInside
        )
    }

    @objc private func didTapСloseButton() {
        viewModel.popToRootViewController()
    }

    @objc private func didTapPlayButton() {
        playerView.playButton.setImage(UIImage(systemName: viewModel.pauseTrack()), for: .normal)
    }

    @objc private func didTapNextButton() {
        viewModel.nextTrack()
        configure()
        playerView.playButton.setImage(UIImage(systemName: Images.pause), for: .normal)
    }

    @objc private func didTapBackButton() {
        viewModel.backTrack()
        configure()
        playerView.playButton.setImage(UIImage(systemName: Images.pause), for: .normal)
    }
}
