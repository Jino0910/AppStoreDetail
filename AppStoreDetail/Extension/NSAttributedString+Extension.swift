//
//  NSAttributedString+Extension.swift
//  AppStoreDetail
//
//  Created by rowkaxl on 2021/07/05.
//

import UIKit

extension NSAttributedString {
    
    public func width(height: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: [.usesLineFragmentOrigin, .usesFontLeading],
                                            context: nil)
        return ceil(boundingBox.width)
    }
    
    public func height(width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: [.usesLineFragmentOrigin, .usesFontLeading],
                                            context: nil)
        return ceil(boundingBox.height)
    }
}

extension String {
    func setAttributedString(font: UIFont) -> NSAttributedString {
        
        return NSAttributedString(string: description, attributes: [
            .font: font
        ])
    }
    
    var byteToMegaByte: CGFloat {
        CGFloat(Int(self) ?? 0) / 1024.0 / 1024.0
    }
}
