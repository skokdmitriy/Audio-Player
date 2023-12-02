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

        } catch {
            print("Ошибка при создании аудиопроигрывателя: \(error)")   
        }
    }

    func pauseTrack() {
        if player?.isPlaying == true {
            player?.pause()
        } else {
            player?.play()
        }
    }

    func nextTrack() {

    }

    func backTrack() {

    }
}
