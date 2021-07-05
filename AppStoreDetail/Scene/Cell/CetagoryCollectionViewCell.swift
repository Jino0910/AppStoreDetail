//
//  CetagoryCollectionViewCell.swift
//  AppStoreDetail
//
//  Created by rowkaxl on 2021/07/05.
//

import UIKit

class CetagoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cv: UICollectionView! {
        didSet {
            let flowLayout: UICollectionViewFlowLayout! = UICollectionViewFlowLayout()
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            flowLayout.minimumInteritemSpacing = 10
            flowLayout.minimumLineSpacing = 10
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

extension CetagoryCollectionViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.model.genres.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.configure(genre: self.model.genres[indexPath.item])
        return cell
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let attribute = self.model.genres[indexPath.item].setAttributedString(font: UIFont.systemFont(ofSize: 12.0))
        
        return CGSize(width: attribute.width(height: 30) + 30,
                      height: 30)
    }

}
