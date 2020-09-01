//
//  PlayerTableViewCell.swift
//  KHL
//
//  Created by Kairzhan Kural on 8/31/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    @IBOutlet var playerNumber: UILabel!
    @IBOutlet var playerImage: UIImageView!
    @IBOutlet var playerName: UILabel!
    
    func configure(with player: Player) {
        playerName.text = player.name
        playerNumber.text = String(player.shirtNumber!)
        
        DispatchQueue.global().async {
            
            guard let imageUrl = URL(string: player.image!) else { return }
            guard let data = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.playerImage.image = UIImage(data: data)
            }
        }
    }
}
