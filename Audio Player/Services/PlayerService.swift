//
//  PlayerService.swift
//  Audio Player
//
//  Created by Дмитрий Скок on 09.12.2023.
//

import Foundation
import AVFoundation
import Combine

final class PlayerService {

    static let shared = PlayerService()
    private init() {}

    var player: AVPlayer?
    var isPlaying: Bool?
    var trackIndex: Int?
    var isTrackEnded = CurrentValueSubject<Bool, Never>(true)
    @Published var currentTime: String?
    @Published var progress: Float?

    func playTrack(with name: String) {
        let url = Bundle.main.path(forResource: name, ofType: "mp3")
        guard let url else {
            return
        }

        player = AVPlayer(url: URL(fileURLWithPath: url))
        player?.play()
        isPlaying = true
        isTrackEnded.send(false)
        progressTime()
    }

    private func progressTime() {
        let interval = CMTime(value: 1, timescale: 1000)
        player?.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: { [weak self] time in
            guard let self else {
                return
            }
            let minutes = time.seconds / 60
            let seconds = Int(time.seconds) % 60
            let minutesString = String(format: "%02d", Int(minutes))
            let secondsString = String(format: "%02d", Int(seconds))
            self.currentTime = "\(minutesString):\(secondsString)"

            if let duration = player?.currentItem?.duration {
                let durationSeconds = CMTimeGetSeconds(duration)
                let progressSeconds = CMTimeGetSeconds(time)
                self.progress = Float(progressSeconds / durationSeconds)

                if durationSeconds == progressSeconds {
                    self.isTrackEnded.send(true)

                }
            }
        })
    }
}
