//
//  TrackListViewModel.swift
//  Audio Player
//
//  Created by Дмитрий Скок on 02.12.2023.
//

import Foundation

final class TrackListViewModel {
    // MARK: - Properties

    var tracks: [Track] = []
    
    // MARK: - Initialization

    init() {
        appendTrack()
    }

    // MARK: - Private functions

    private func appendTrack() {
        tracks.append(Track(title: "No Roots",
                            artist: "Alice Merton",
                            duration: "03:56",
                            trackName: "track1")
        )
        tracks.append(Track(title: "Carry On My Wayward Son",
                            artist: "Canzas",
                            duration: "05:23",
                            trackName: "track2")
        )
        tracks.append(Track(title: "Warriors",
                            artist: "Imagine Dragons",
                            duration: "03:46",
                            trackName: "track3")
        )
        tracks.append(Track(title: "Counting stars",
                            artist: "One Republic",
                            duration: "04:18",
                            trackName: "track4")
        )
    }
}
