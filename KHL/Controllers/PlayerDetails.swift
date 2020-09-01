//
//  PlayerDetails.swift
//  KHL
//
//  Created by Kairzhan Kural on 8/31/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

class PlayerDetails: UIViewController {
    
    var player: Player!

    @IBOutlet var playerImage: UIImageView!
    @IBOutlet var playerName: UILabel!
    @IBOutlet var playerTeam: UILabel!
    @IBOutlet var playerNumber: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = player.name
        
        playerName.text = player.name
        playerTeam.text = player.team.name
        playerNumber.text = String(player.shirtNumber!)
        
        DispatchQueue.global().async {
            
            guard let url = self.player.image else { return }
            guard let imageUrl = URL(string: url) else { return }
            guard let data = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.playerImage.image = UIImage(data: data)
                self.activityIndicator.isHidden = true
            }
        }
    }

}
