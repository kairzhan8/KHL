//
//  TeamCollectionViewCell.swift
//  KHL
//
//  Created by Kairzhan Kural on 8/30/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

class TeamCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var teamLogo: UIImageView!
    @IBOutlet var teamName: UILabel!
    
    func configure(with team: Team) {
        teamName.text = team.teamDetails.name
        
        DispatchQueue.global().async {
            
            guard let image = team.teamDetails.image else { return }
            guard let imageUrl = URL(string: image) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.teamLogo.image = UIImage(data: imageData)
            }
        }
    }
    
}
