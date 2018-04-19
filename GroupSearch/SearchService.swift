//
//  SearchService.swift
//  VkGb
//
//  Created by VitaliyFilippov on 10.04.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON

class SearchService: Service {
    private let path = "groups.search"
    
    func searchGroups(name: String, completion: @escaping ([VKGroup]) -> Void) {
        let parameters: Parameters = [
            "access_token": token,
            "extended": "1",
            "q": name,
            "lang": "ru",
            "count": "3",
            "v": protocolVersion
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: parameters).responseData { response in
            guard let data = response.value else { return }
            let json = try! JSON(data: data)
            let groupsList = json["response"]["items"].array!.map { VKGroup(photo_50: $0["photo_50"].stringValue, name: $0["name"].stringValue) }
            completion(groupsList)
        }
    }
}
