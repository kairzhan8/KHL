//
//  TeamDetail.swift
//  KHL
//
//  Created by Kairzhan Kural on 8/31/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

class TeamDetail: UIViewController {
    
    var team: Team?

    @IBOutlet var teamLogo: UIImageView!
    @IBOutlet var teamName: UILabel!
    @IBOutlet var teamLocation: UILabel!
    @IBOutlet var teamDivision: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamName.text = team?.teamDetails.name
        teamLocation.text = team?.teamDetails.location
        teamDivision.text = team?.teamDetails.division
        
        guard let image = team?.teamDetails.image else { return }
        guard let url = URL(string: image) else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        
        DispatchQueue.main.async {
            self.teamLogo.image = UIImage(data: data)
        }
    }

}
