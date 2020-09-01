//
//  Team.swift
//  KHL
//
//  Created by Kairzhan Kural on 8/30/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

struct Team: Codable {
    let teamDetails: TeamDetails
    
    enum CodingKeys: String, CodingKey {
        case teamDetails = "team"
    }
}

struct TeamDetails: Codable {
    let id: Int?
    let name: String?
    let location: String?
    let image: String?
    let division: String?
}
