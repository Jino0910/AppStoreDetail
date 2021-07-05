//
//  ScreenShotCell.swift
//  AppStoreDetail
//
//  Created by rowkaxl on 2021/07/06.
//

import UIKit
import Kingfisher

class ScreenShotCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    override func prepareForReuse() {
        image.kf.cancelDownloadTask()
    }
    
    func configure(screenShot: String) {
        
        image.kf.setImage(with: URL(string: screenShot),
                                    options: [.transition(ImageTransition.fade(0.2))])
    }
}
