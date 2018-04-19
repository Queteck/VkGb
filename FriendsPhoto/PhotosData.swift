//
//  PhotosData.swift
//  VkGb
//
//  Created by VitaliyFilippov on 16.04.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.
//

import Foundation

struct VKPhotos: Codable {
    let photo_75: String
    let owner_id: Int
}
struct PhotoResponse: Codable {
    let response: Photos
}

struct Photos: Codable {
    let count: Int
    let items: [VKPhotos]
}
