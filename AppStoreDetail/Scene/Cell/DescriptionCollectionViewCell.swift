//
//  DescriptionCollectionViewCell.swift
//  AppStoreDetail
//
//  Created by rowkaxl on 2021/07/05.
//

import UIKit

class DescriptionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(model: DetailModel) {
        self.descriptionLabel.text = model.description
    }
        
    static func cellHeight(width: CGFloat, desc: String) -> CGFloat {
        
        let attribute = desc.setAttributedString(font: UIFont.systemFont(ofSize: 14.0))
        return attribute.height(width: width-20) + 20
    }
}
