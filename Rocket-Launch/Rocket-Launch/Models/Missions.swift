//
//  Missions.swift
//  Rocket-Launch
//
//  Created by Daniel Barclay on 01/01/2020.
//  Copyright © 2020 Daniel Barclay. All rights reserved.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let crew: [CrewRole]
    let description: String
    let launchDate: Date?

    var displayName: String {
        "Apollo \(id)"
    }

    var displayDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        }
        return "N/A"
    }

    var image: String {
        "apollo\(id)"
    }
}
