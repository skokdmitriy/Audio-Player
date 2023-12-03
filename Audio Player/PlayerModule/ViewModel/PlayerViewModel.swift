//
//  PlayerViewModel.swift
//  Audio Player
//
//  Created by Дмитрий Скок on 03.12.2023.
//

import Foundation

final class PlayerViewModel {
    
    var currentTrackIndex: Int
    var track: Track

    init(currentTrackIndex: Int, track: Track) {
        self.currentTrackIndex = currentTrackIndex
        self.track = track
    }
}
