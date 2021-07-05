//
//  ScreenShotCollectionViewCell.swift
//  AppStoreDetail
//
//  Created by rowkaxl on 2021/07/05.
//

import UIKit

class ScreenShotCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cv: UICollectionView! {
        didSet {
            let flowLayout: UICollectionViewFlowLayout! = UICollectionViewFlowLayout()
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            flowLayout.minimumInteritemSpacing = 0
            flowLayout.minimumLineSpacing = 0
            flowLayout.scrollDirection = .horizontal
            cv.collectionViewLayout = flowLayout
        }
    }

    var model: DetailModel!
    
    func configure(model: DetailModel) {
        
        self.model = model
        self.cv.delegate = self
        self.cv.dataSource = self
    }
}

extension ScreenShotCollectionViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.model.screenshotUrls.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScreenShotCell", for: indexPath) as! ScreenShotCell
        cell.configure(screenShot: self.model.screenshotUrls[indexPath.item])
        return cell
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width,
                      height: 400)
    }

}
