//
//  PlayerAssembly.swift
//  Audio Player
//
//  Created by Дмитрий Скок on 03.12.2023.
//

import UIKit

final class PlayerAssembly {
    static func build(currentTrackIndex: Int, track: Track) -> UIViewController {
        let viewModel = PlayerViewModel(currentTrackIndex: currentTrackIndex, track: track)
        let viewController = PlayerViewController(viewModel: viewModel)
        return viewController
    }
}
