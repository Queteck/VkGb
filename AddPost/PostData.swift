//
//  PostData.swift
//  VkGb
//
//  Created by VitaliyFilippov on 25.05.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

class PostData: Object {
    @objc dynamic var message: String = ""
    
    convenience init(json: JSON) {
        self.init()
        self.message = json["message"].stringValue
    }
}
