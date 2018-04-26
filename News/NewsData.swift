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
    
    convenience init(json: JSON) {
        self.init()
        self.text = json["text"].stringValue
        self.source_id = json["source_id"].intValue
        
    }
}
