//
//  NewsData.swift
//  VkGb
//
//  Created by VitaliyFilippov on 25.04.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

class NewsData: Object {
    @objc dynamic var text: String = ""
    @objc dynamic var source_id: Int = 0
    @objc dynamic var comments: Int = 0
    @objc dynamic var likes: Int = 0
    @objc dynamic var photo: String = ""
    
    convenience init(json: JSON) {
        self.init()
        self.text = json["text"].stringValue
        self.source_id = json["owner_id"].intValue
        self.comments = json["comments"]["count"].intValue
        self.likes = json["likes"]["count"].intValue
        self.photo = json["photo_75"].stringValue
    }
}
