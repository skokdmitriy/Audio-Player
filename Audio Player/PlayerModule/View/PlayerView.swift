//
//  PlayerView.swift
//  Audio Player
//
//  Created by Дмитрий Скок on 02.12.2023.
//

import UIKit

final class PlayerView: UIView{
    // MARK: - Views

    lazy var closeButtonView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        view.addSubview(closeButton)
        return view
    }()

    lazy var closeButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.title = "Close"
        configuration.image = UIImage(systemName: "xmark")
        configuration.imagePadding = 3
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        button.configuration = configuration
        button.tintColor = .systemBlue
        return button
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        return label
    }()

    lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        return label
    }()

    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(artistLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    lazy var currentTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var durationTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var trackProgress: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressViewStyle = .bar
        progressView.progressTintColor = .systemBlue
        progressView.trackTintColor = .gray
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()

    lazy var playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "pause"), for: .normal)
        button.tintColor = .systemBlue
        return button
    }()

    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "forward.end"), for: .normal)
        button.tintColor = .systemBlue
        return button
    }()

    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "backward.end"), for: .normal)
        button.tintColor = .systemBlue
        return button
    }()

    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(backButton)
        stackView.addArrangedSubview(playButton)
        stackView.addArrangedSubview(nextButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupLayout()
        backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Private functions

    private func setupLayout() {
        addSubview(titleStackView)
        addSubview(currentTimeLabel)
        addSubview(durationTimeLabel)
        addSubview(trackProgress)
        addSubview(buttonStackView)

        NSLayoutConstraint.activate([
            titleStackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            titleStackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),

            currentTimeLabel.topAnchor.constraint(equalTo: titleStackView.bottomAnchor,
                                                  constant: 20),
            currentTimeLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                                      constant: 20),
            currentTimeLabel.bottomAnchor.constraint(equalTo: trackProgress.topAnchor,
                                                     constant: -8),
            durationTimeLabel.topAnchor.constraint(equalTo: titleStackView.bottomAnchor,
                                                   constant: 20),
            durationTimeLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                                        constant: -20),
            durationTimeLabel.bottomAnchor.constraint(equalTo: trackProgress.topAnchor,
                                                      constant: -8),
            trackProgress.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                                   constant: 20),
            trackProgress.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                                    constant: -20),
            buttonStackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            buttonStackView.topAnchor.constraint(equalTo: trackProgress.bottomAnchor, constant: 20)
        ])
    }
}
