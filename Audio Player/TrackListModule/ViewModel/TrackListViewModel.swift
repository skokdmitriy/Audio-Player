//
//  TrackListViewModel.swift
//  Audio Player
//
//  Created by Дмитрий Скок on 02.12.2023.
//

import Foundation

final class TrackListViewModel {

    var tracks = [Track]()

    init() {
        tracks.append(Track(title: "No Roots",
                            artist: "Alice Merton",
                            duration: "03:58",
                            fileURL: URL(fileURLWithPath: "path/to/track1.mp3"))
        )
        tracks.append(Track(title: "Carry On My Wayward Son",
                            artist: "Canzas", duration: "05:23",
                            fileURL: URL(fileURLWithPath: "path/to/track2.mp3"))
        )
        tracks.append(Track(title: "Warriors",
                            artist: "Imagine Dragons",
                            duration: "03:46",
                            fileURL: URL(fileURLWithPath: "path/to/track3.mp3"))
        )
        tracks.append(Track(title: "Counting stars",
                            artist: "One Republic",
                            duration: "04:18",
                            fileURL: URL(fileURLWithPath: "path/to/track4.mp3"))
        )
    }
}
