//
//  TeamDetailsViewController.swift
//  KHL
//
//  Created by Kairzhan Kural on 8/31/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit
import Alamofire

class TeamDetailsViewController: UITableViewController {
    
    var team: Team!
    var players: [Player] = []
    var arr: [Player] = []

    @IBOutlet var teamLogo: UIImageView!
    @IBOutlet var teamName: UILabel!
    @IBOutlet var teamLocation: UILabel!
    @IBOutlet var teamDivision: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = team.teamDetails.name
        
        teamName.text = team.teamDetails.name
        teamLocation.text = team.teamDetails.location
        teamDivision.text = team.teamDetails.division
        
        guard let url = team.teamDetails.image else { return }
        guard let imageUrl = URL(string: url) else { return }
        guard let data = try? Data(contentsOf: imageUrl) else { return }
        
        DispatchQueue.main.async {
            self.teamLogo.image = UIImage(data: data)
            
        }

        NetworkManager.fetchPlayers { players in
            self.players = players
            self.tableView.reloadData()
        }
        
        
        

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "player", for: indexPath) as! PlayerTableViewCell
        
        let player = players[indexPath.row]
        
        if team.teamDetails.id == player.team.id {
            cell.configure(with: player)
        } else {
            cell.isHidden = true
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "player" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let playerDetailVC = segue.destination as! PlayerDetails
            playerDetailVC.player = players[indexPath.row]
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

}
