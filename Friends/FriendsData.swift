//
//  FriendsData.swift
//  VkGb
//
//  Created by VitaliyFilippov on 12.04.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.
//

import Foundation
import RealmSwift

class VKFriend: Object {
    @objc dynamic var first_name: String = ""
    @objc dynamic var last_name: String = ""
    @objc dynamic var photo_50: String = ""
    @objc dynamic var id: Int = 0
    
    convenience init(photo_50: String, first_name: String, last_name: String, id: Int) {
        self.init()
        self.photo_50 = photo_50
        self.first_name = first_name
        self.last_name = last_name
        self.id = id
    }
}
