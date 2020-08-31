//
//  NetworkManager.swift
//  KHL
//
//  Created by Kairzhan Kural on 8/30/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import Alamofire

class NetworkManager {
    
    static private let jsonUrl = "https://khl.api.webcaster.pro/api/khl_mobile/teams_v2.json"
    
    static func fetchTeams(completion: @escaping ([Team]) -> ()) {
        guard let url = URL(string: jsonUrl) else { return }
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
}
