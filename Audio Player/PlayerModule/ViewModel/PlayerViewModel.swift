//
//  PlayerViewModel.swift
//  Audio Player
//
//  Created by Дмитрий Скок on 03.12.2023.
//

import Foundation
import Combine

final class PlayerViewModel {

    private let router: PlayerRouter
    private let playerService = PlayerService.shared
    var tracks: [Track] = []
    var track: Track
    var currentTrackIndex: Int


    init(router: PlayerRouter, currentTrackIndex: Int, track: Track) {
        self.router = router
        self.currentTrackIndex = currentTrackIndex
        self.track = track
        play()
    }

    func play() {
        guard playerService.trackIndex != currentTrackIndex else {
            return
        }
        playerService.playTrack(with: track.trackName)
        playerService.trackIndex = currentTrackIndex
    }

    func pauseTrack() -> String {
        if playerService.isPlaying == true {
            playerService.player?.pause()
            playerService.isPlaying = false
            return "play"
        } else {
            playerService.player?.play()
            playerService.isPlaying = true
            return "pause"
        }
    }

    func nextTrack() {
        if currentTrackIndex < (tracks.count - 1) {
            currentTrackIndex += 1
            print(currentTrackIndex)
            track = tracks[currentTrackIndex]
            play()
        } else {
            currentTrackIndex = 0
            track = tracks[currentTrackIndex]
            play()
        }

    }

    func backTrack() {
        if currentTrackIndex > 0 {
            currentTrackIndex -= 1
            track = tracks[currentTrackIndex]
            play()
        } else {
            currentTrackIndex = 0
            track = tracks[currentTrackIndex]
            play()
        }
    }

    func popToRootViewController() {
        router.showTrackList()
    }
}
