//
//  AudioPlayerService.swift
//  Audio Player
//
//  Created by Дмитрий Скок on 02.12.2023.
//

import Foundation
import AVFoundation

final class AudioPlayerService {

    static let shared = AudioPlayerService()
    private init() {}

    var player: AVPlayer?
    var tracks: [Track] = []
    var currentTrackIndex: Int = 0
    var timer = Timer()
    var isPlaying = Bool()

    func playTrack (currentTrackIndex: Int) {
        let track = tracks[currentTrackIndex]
        let url = Bundle.main.path(forResource: track.trackName, ofType: "mp3")
        guard let url else {
            return
        }
        player = AVPlayer(url: URL(fileURLWithPath: url))
        player?.play()
        isPlaying = true

    }

    func nextTrack() {
        if currentTrackIndex < (tracks.count - 1) {
            currentTrackIndex += 1
            playTrack(currentTrackIndex: currentTrackIndex)
        } else {
            currentTrackIndex = tracks.count
            currentTrackIndex = 0
            playTrack(currentTrackIndex: currentTrackIndex)
        }
    }

    func backTrack() {
        if currentTrackIndex > 0 {
            currentTrackIndex = currentTrackIndex - 1
            playTrack(currentTrackIndex: currentTrackIndex)
        } else {
            currentTrackIndex = 0
            let index = 3
            playTrack(currentTrackIndex: index)
        }
    }
}
