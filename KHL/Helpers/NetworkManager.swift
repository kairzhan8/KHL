//
//  NetworkManager.swift
//  KHL
//
//  Created by Kairzhan Kural on 8/30/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import Alamofire

class NetworkManager {
    
    static private let teamsUrl = "https://khl.api.webcaster.pro/api/khl_mobile/teams_v2.json"
    static private let playersUrl = "https://khl.api.webcaster.pro/api/khl_mobile/players_v2_light.json"
    
    static func fetchTeams(completion: @escaping ([Team]) -> ()) {
        guard let url = URL(string: teamsUrl) else { return }
        AF.request(url).validate().responseJSON { responseData in
            switch responseData.result {
            case .success( _):
                guard let data = responseData.data else { return }
                let decodedData = try? JSONDecoder().decode([Team].self, from: data)
                let teams = decodedData
                
                DispatchQueue.main.async {
                    completion(teams ?? [])
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static func fetchPlayers(completion: @escaping ([Player]) -> ()) {
        guard let url = URL(string: playersUrl) else { return }
        AF.request(url).validate().responseJSON { responseData in
            switch responseData.result {
            case .success( _):
                guard let data = responseData.data else { return }
                let decodedData = try? JSONDecoder().decode([Player].self, from: data)
                let players = decodedData
                
                DispatchQueue.main.async {
                    completion(players ?? [])
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}
