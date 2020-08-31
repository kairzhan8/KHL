//
//  Extension + TeamsVC.swift
//  KHL
//
//  Created by Kairzhan Kural on 8/31/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

extension TeamsViewController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 50)
    }
}
