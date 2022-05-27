//
//  AudioManagerViewModel.swift
//  FootballChants
//
//  Created by waheedCodes on 10/07/2021.
//

import Foundation
import AVKit

class AudioManagerViewModel {
    
    // MARK: - PROPERTIES
    
    private var chantAudioPlayer: AVAudioPlayer?
    
    // MARK: - HELPER METHODS
    
    func playback(_ team: Team) {
        
        if team.isPlaying {
            chantAudioPlayer?.stop()
        } else {
            guard let path = Bundle.main.path(forResource: "\(team.id.chantFile).mp3", ofType: nil) else {
                // Handle error
                return
            }
            
            let url = URL(fileURLWithPath: path)
            
            do {
                chantAudioPlayer = try AVAudioPlayer(contentsOf: url)
                chantAudioPlayer?.numberOfLoops = -1
                chantAudioPlayer?.play()
            } catch {
                print(error)
            }
        }
    }
}
