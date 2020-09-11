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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.fetchTeams { teams in
            self.teams = teams
            self.collectionView.reloadData()
        }
    }

    @IBAction func back() {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "team", for: indexPath) as! TeamCollectionViewCell
        
        let team = teams[indexPath.item]
        cell.configure(with: team)
    
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let teamDetailVC = segue.destination as! TeamDetailsViewController
        let cell = sender as! UICollectionViewCell
        let indexPath = collectionView.indexPath(for: cell)
        teamDetailVC.team = teams[indexPath!.row]
    }

}
