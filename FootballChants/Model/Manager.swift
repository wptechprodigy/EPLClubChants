//
//  Manager.swift
//  FootballChants
//
//  Created by waheedCodes on 08/07/2021.
//

import Foundation

enum Job: String {
    case manager = "Manager"
    case headCoach = "Head Coach"
}

struct Manager {
    let name: String
    let job: Job
}
