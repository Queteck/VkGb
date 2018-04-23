//
//  AllGroupsService.swift
//  VkGb
//
//  Created by VitaliyFilippov on 09.04.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.

import Alamofire
import Foundation
import SwiftyJSON
import RealmSwift

class AllGroupsService: Service {
    let path = "groups.get"
    
    func searchGroups() {
        let parameters: Parameters = [
            "access_token": token,
            "extended": "1",
            "lang": "ru",
            "count": "3",
            "v": protocolVersion
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: parameters).responseData { response in
            guard let data = response.value else { return }
            let json = try! JSON(data: data)
            let groupsList = json["response"]["items"].array!.map { VKGroup(photo_50: $0["photo_50"].stringValue, name: $0["name"].stringValue) }
            
            self.saveToRealm(groups: groupsList)
        }
    }
    
    func saveToRealm(groups: [VKGroup]) {
        let realm = try! Realm()
        
        try! realm.write {
            let oldGroups = realm.objects(VKGroup.self)
            realm.delete(oldGroups)
            realm.add(groups)
        }
    }
}

