//
//  Player.swift
//  KHL
//
//  Created by Kairzhan Kural on 8/31/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

struct Player: Codable {
    let name: String?
    let shirtNumber: Int?
    let image: String?
    let team: PlayersTeam
    
    enum CodingKeys: String, CodingKey {
        case name, shirtNumber = "shirt_number", image, team
    }
}

struct PlayersTeam: Codable {
    let id: Int?
    let name: String?
}
