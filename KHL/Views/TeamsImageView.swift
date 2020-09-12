//
//  TeamsImageView.swift
//  KHL
//
//  Created by Kairzhan Kural on 9/12/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

class TeamsImageVeiw: UIImageView {
    
    func fetchTeamsImage(with url: String?) {
        guard let url = url else { return }
        guard let imageUrl = URL(string: url) else {
            image = #imageLiteral(resourceName: "1200px-KHL_logo_shield_2016.svg")
            return
        }
        
        // если изображение есть в кэше, то используем его
        if let cachedImage = getCachedImage(url: imageUrl) {
            image = cachedImage
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            if let error = error { print(error); return }
            guard let data = data, let response = response else { return }
            guard let responseUrl = response.url else { return }
            
            if responseUrl.absoluteString != url { return }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
            
            //сохраняем изображение в кэш
            self.saveImageToCache(data: data, response: response)
            
        }.resume()
    
    }
    
    private func saveImageToCache(data: Data, response: URLResponse) {
        guard let responseUrl = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseUrl))
    }
    
    private func getCachedImage(url: URL) -> UIImage? {
        if let cacheResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            return UIImage(data: cacheResponse.data)
        }
        return nil
    }
}
