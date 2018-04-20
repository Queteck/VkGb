//
//  FriendsService.swift
//  VkGb
//
//  Created by VitaliyFilippov on 10.04.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.
//
//
import Alamofire
import Foundation
import SwiftyJSON
import RealmSwift

class FriendsService: Service {
    let path = "friends.get"
    
    func loadFriends() {
        let parameters: Parameters = [
            "access_token": token,
            "fields": "first_name, photo_50",
            "lang": "ru",
            "count": "3",
            "v": protocolVersion
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: parameters).responseData { response in
            guard let data = response.value else { return }
            let json = try! JSON(data: data)
            let friendsList = json["response"]["items"].array!.map { VKFriend(photo_50: $0["photo_50"].stringValue, first_name: $0["first_name"].stringValue, last_name: $0["last_name"].stringValue)}
            
            self.saveToRealm(friends: friendsList)
        }
    }
    
    func saveToRealm(friends: [VKFriend]) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(friends)
        }
    }
}
