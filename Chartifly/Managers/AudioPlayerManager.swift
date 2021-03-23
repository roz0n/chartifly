//
//  AudioPlayerManager.swift
//  Chartifly
//
//  Created by Arnaldo Rozon on 3/22/21.
//

import Foundation
import AVKit

final class AudioPlayerManager {
    
    static let shared = AudioPlayerManager()
    
    let player: AVPlayer = {
        let avPlayer = AVPlayer()
        avPlayer.automaticallyWaitsToMinimizeStalling = false
        return avPlayer
    }()
    
    func playAudio(from url: String?) {
        guard let audioUrl = url else { return }
        
        if let url = URL(string: audioUrl) {
            let playerItem = AVPlayerItem(url: url)
            player.replaceCurrentItem(with: playerItem)
            player.play()
        }
    }
    
}
