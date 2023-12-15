//
//  TrackListRouter.swift
//  Audio Player
//
//  Created by Дмитрий Скок on 12.12.2023.
//

import UIKit.UIViewController

final class TrackListRouter {
    weak var viewController: UIViewController?

    func showPlayer(currentTrackIndex: Int, track: Track, tracks: [Track]) {
        if let viewController = viewController {
            let playerViewController = PlayerAssembly.build(currentTrackIndex: currentTrackIndex,
                                                            track: track,
                                                            tracks: tracks
            )
            let nav = UINavigationController(rootViewController: playerViewController)
            nav.modalPresentationStyle = .pageSheet
            viewController.present(nav, animated: true)
        }
    }
}
