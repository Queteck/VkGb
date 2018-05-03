//
//  ProfilesData.swift
//  VkGb
//
//  Created by Наталья Давыдова on 03.05.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

class ProfilesData: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var author: String = ""
    @objc dynamic var authorPhoto: String = ""
    
    convenience init(json: JSON) {
        self.init()
        self.id = json["id"].intValue
        self.author = json["first_name"].stringValue + " " + json["last_name"].stringValue
        self.authorPhoto = json["photo_50"].stringValue
    }
}

