//
//  PhotosData.swift
//  VkGb
//
//  Created by VitaliyFilippov on 16.04.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.
//

import Foundation
import RealmSwift

class VKPhotos: Object {
    @objc dynamic var photo_75: String = ""
    @objc dynamic var owner_id: Int = 0
    convenience init(photo_75: String, owner_id: Int) {
        self.init()
        self.photo_75 = photo_75
        self.owner_id = owner_id
    }
}
