//
//  CategoryCell.swift
//  AppStoreDetail
//
//  Created by rowkaxl on 2021/07/06.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var category: UILabel!
    
    func configure(genre: String) {
        self.category.text = "#\(genre)"
        self.category.font = UIFont.systemFont(ofSize: 12)
        self.category.textColor = #colorLiteral(red: 0.234831959, green: 0.6399164796, blue: 0.6863546371, alpha: 1)
        self.category.textAlignment = .center
        self.category.layer.borderColor = UIColor.lightGray.cgColor
        self.category.layer.borderWidth = 1.0
        self.category.layer.cornerRadius = 10.0
    }
}


