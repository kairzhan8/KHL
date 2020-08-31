//
//  TeamsViewController.swift
//  KHL
//
//  Created by Kairzhan Kural on 8/30/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit
import Alamofire

class TeamsViewController: UICollectionViewController {
    
    var teams: [Team] = []
    let jsonUrl = "https://khl.api.webcaster.pro/api/khl_mobile/teams_v2.json"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.fetchTeams { teams in
            self.teams = teams
            self.collectionView.reloadData()
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return teams.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "team", for: indexPath) as! TeamCollectionViewCell
        
        let team = teams[indexPath.item]
        print("team", team)
        cell.configure(with: team)
        
        
        // Configure the cell
    
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let teamDetailVC = segue.destination as! TeamDetail
        let cell = sender as! UICollectionViewCell
        let indexPath = collectionView.indexPath(for: cell)
        teamDetailVC.team = teams[indexPath!.row]
    }

}
