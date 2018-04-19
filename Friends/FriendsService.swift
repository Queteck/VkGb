//
//  FriendsService.swift
//  VkGb
//
//  Created by VitaliyFilippov on 10.04.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.
//
//
//import Foundation
//import Alamofire
//
//class FriendsService{
//    let baseUrl = "https://api.vk.com/method/"
//    let protocolVersion = "5.74"
//    func loadFriends() {
//        let parameters: Parameters = [
//            "access_token": token,
//            "fields": "nickName",
//            "v": protocolVersion
//        ]
//        let path = "friends.get"
//        Alamofire.request(baseUrl + path, method: .get, parameters: parameters).responseJSON {response in print (response.value!)}
//    }
//}
