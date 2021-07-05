//
//  DesignatedInfoCollectionViewCell.swift
//  AppStoreDetail
//
//  Created by rowkaxl on 2021/07/05.
//

import UIKit
import RxSwift

class DesignatedInfoCollectionViewCell: UICollectionViewCell {
    
    var bag = DisposeBag()
    
    override func prepareForReuse() {
        self.bag = DisposeBag()
    }
    
    @IBOutlet weak var fileSizeLabel: UILabel!
    @IBOutlet weak var newVersionLabel: UILabel!
    @IBOutlet weak var newDescriptionLabel: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    
    static let minimumHeight: CGFloat = 76
    
    func configure(model: DetailModel, isOpen: Bool) {
        self.fileSizeLabel.text = String(format: "%.2f MB", model.fileSizeBytes.byteToMegaByte)
        self.newVersionLabel.text = model.version
        self.newDescriptionLabel.text = model.releaseNotes
        
        self.arrowImage.image = isOpen ? #imageLiteral(resourceName: "arrowClose") : #imageLiteral(resourceName: "arrowOpen")
    }
        
    static func cellHeight(width: CGFloat, isOpen: Bool, desc: String) -> CGFloat {
        
        if isOpen {
            let attribute = desc.setAttributedString(font: UIFont.systemFont(ofSize: 14.0))
            return self.minimumHeight + attribute.height(width: width-20) + 20
        } else {
            return self.minimumHeight
        }
    }
}
