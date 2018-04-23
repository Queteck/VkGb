//
//  FriendsPhotoService.swift
//  VkGb
//
//  Created by VitaliyFilippov on 10.04.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON
import RealmSwift

class FriendsPhotoService: Service {
    let path = "photos.getAll"
    
    func loadPhotos(ownerID: Int) {
        let parameters: Parameters = [
            "access_token": token,
            "owner_id": ownerID,
            "count": "3",
            "v": protocolVersion
        ]
        Alamofire.request(baseUrl + path, method: .get, parameters: parameters).responseData { response in
            guard let data = response.value else { return }
            let json = try! JSON(data: data)
            let photosList = json["response"]["items"].array!.map { VKPhotos(photo_75: $0["photo_75"].stringValue, owner_id: $0[0].intValue)}
            
            self.saveToRealm(photos: photosList)
        }
    }
    func saveToRealm(photos: [VKPhotos]) {
        let realm = try! Realm()
        
        try! realm.write {
            let oldPhotos = realm.objects(VKPhotos.self)
            realm.delete(oldPhotos)
            realm.add(photos)
        }
    }
}

