//
//  FriendsData.swift
//  VkGb
//
//  Created by VitaliyFilippov on 12.04.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.
//

import Foundation

struct VKFriend: Codable {
    let first_name: String
    let last_name: String
    let photo_50: String
    let id: Int
}

struct FriendResponse: Codable {
    let response: Friends
}

struct Friends: Codable {
    let count: Int
    let items: [VKFriend]
}
