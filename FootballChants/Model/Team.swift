//
//  Team.swift
//  FootballChants
//
//  Created by waheedCodes on 08/07/2021.
//

import Foundation

// Had to be a class and not a struct because
// we need to be able to update the isPlaying property to `true` when the playback button is tapped.
// So, since class will still have a reference to it in memory, we don't have to bother about mutation error.

class Team {
    
    let id: TeamDescription
    let name: String
    let info: String
    let manager: Manager
    let founded: String
    var isPlaying: Bool
    
    internal init(
        id: TeamDescription,
        name: String,
        info: String,
        manager: Manager,
        founded: String,
        isPlaying: Bool = false
    ) {
        self.id = id
        self.name = name
        self.info = info
        self.manager = manager
        self.founded = founded
        self.isPlaying = isPlaying
    }
}
