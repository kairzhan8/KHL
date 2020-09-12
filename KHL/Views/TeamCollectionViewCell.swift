//
//  TeamCollectionViewCell.swift
//  KHL
//
//  Created by Kairzhan Kural on 8/30/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

class TeamCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var teamLogo: TeamsImageVeiw!
    @IBOutlet var teamName: UILabel!
    
    func configure(with team: Team) {
        teamName.text = team.teamDetails.name
        teamLogo.fetchTeamsImage(with: team.teamDetails.image)
    }
    
}
