//
//  PlayerAssembly.swift
//  Audio Player
//
//  Created by Дмитрий Скок on 03.12.2023.
//

import UIKit.UIViewController

final class PlayerAssembly {
    static func build(currentTrackIndex: Int, track: Track, tracks: [Track]) -> UIViewController {
        let router = PlayerRouter()
        let viewModel = PlayerViewModel(router: router,
                                        currentTrackIndex: currentTrackIndex,
                                        track: track
        )
        viewModel.tracks = tracks
        let viewController = PlayerViewController(viewModel: viewModel)
        router.viewController = viewController
        return viewController
    }
}
