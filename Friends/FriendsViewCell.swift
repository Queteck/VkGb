//
//  FriendsViewCell.swift
//  VkGb
//
//  Created by VitaliyFilippov on 05.04.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.
//

import UIKit

class FriendsViewCell: UITableViewCell {
    @IBOutlet weak var friendsList: FriendsViewCell!
    @IBOutlet weak var friendsName: UILabel!
    @IBOutlet weak var friendAvatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
