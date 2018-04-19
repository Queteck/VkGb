//
//  GroupsData.swift
//  VkGb

//  Created by VitaliyFilippov on 12.04.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.
//

import Foundation
import RealmSwift

class VKGroup: Object {
    @objc dynamic var photo_50: String = ""
    @objc dynamic var name: String = ""
    
    convenience init(photo_50: String, name: String) {
        self.init()
        self.photo_50 = photo_50
        self.name = name
    }
}
