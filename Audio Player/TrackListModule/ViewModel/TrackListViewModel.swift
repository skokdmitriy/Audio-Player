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
    private let router: TrackListRouter?

    // MARK: - Initialization

    init(router: TrackListRouter) {
        self.router = router
        appendTrack()
    }
    
    // MARK: - Functions

    func tapOnTrack(indexPath: IndexPath) {
        let currentTrackIndex = indexPath.row
        let track = tracks[indexPath.row]
        router?.showPlayer(currentTrackIndex: currentTrackIndex, track: track, tracks: tracks)
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
        tracks.append(Track(title: "Test",
                            artist: "Track",
                            duration: "00:12",
                            trackName: "track5")
        )
    }
}
