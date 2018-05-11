//
//  FriendsPhotoViewCell.swift
//  VkGb
//
//  Created by VitaliyFilippov on 05.04.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.
//

import UIKit

class FriendsPhotoViewCell: UICollectionViewCell {
    
    let instets: CGFloat = 10.0
    
    @IBOutlet weak var photoView: UIImageView!{
        didSet {
            photoView.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func iconFrame() {
        let iconSideLinght: CGFloat = 50
        let iconSize = CGSize(width: iconSideLinght, height:
            iconSideLinght)
        let iconOrigin = CGPoint(x: bounds.midX - iconSideLinght / 2, y:
            bounds.midY - iconSideLinght / 2)
        photoView.frame = CGRect(origin: iconOrigin, size: iconSize)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconFrame()
    }
}
