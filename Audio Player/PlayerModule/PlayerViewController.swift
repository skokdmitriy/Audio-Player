//
//  PlayerViewController.swift
//  Audio Player
//
//  Created by Дмитрий Скок on 02.12.2023.
//

import UIKit
import AVFoundation

final class PlayerViewController: UIViewController {

    var currentTrackIndex: Int = 0
    let player = AudioPlayerService.shared


    @IBOutlet var playerView: PlayerView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        playTrack(index: currentTrackIndex)
    }

    private func playTrack(index: Int) {
        player.playTrack(currentTrackIndex: index)
    }
}
