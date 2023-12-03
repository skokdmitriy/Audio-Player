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

    var player: AVAudioPlayer?
    var tracks: [Track] = []
    var currentTrackIndex: Int = 0
    var durationTrack = TimeInterval()
    var currentTimeTrack = TimeInterval()
    var timer = Timer()

    func playTrack (currentTrackIndex: Int) {
        let track = tracks[currentTrackIndex]
        let urlString = Bundle.main.path(forResource: track.trackName, ofType: "mp3")

        do {
            guard let urlString,
                  let content = URL(string: urlString) else {
                return
            }
            player = try AVAudioPlayer(contentsOf: content)

            guard let player else {
                return
            }
            player.play()
            durationTrack = player.duration
            currentTimeTrack = player.currentTime
        } catch {
            print("Ошибка при создании аудиопроигрывателя: \(error)")
        }
    }

   @objc func updateTime() {
        let currentTime = Int(currentTimeTrack)
        let minutes = currentTime / 60
        let seconds = currentTime % 60
        print(String(format: "%02d:%02d", minutes, seconds))
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
