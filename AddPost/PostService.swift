//
//  PostService.swift
//  VkGb
//
//  Created by VitaliyFilippov on 25.05.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON
import RealmSwift

class PostService: Service {
    let path = "wall.post"
    
    func post(text: String, completion: @escaping () -> Void) {
        let parameters: Parameters = [
            "access_token": token,
            "message": text,
            "v": protocolVersion
        ]
        
        Alamofire.request(baseUrl + path, method: .post, parameters: parameters).responseData(queue: DispatchQueue.global()) { response in
            completion()
        }
    }
}
