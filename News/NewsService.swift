//
//  NewsService.swift
//  VkGb
//
//  Created by VitaliyFilippov on 25.04.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON
import RealmSwift

class NewsService: Service {
    let path = "newsfeed.get"
    
    func loadNews(completion: @escaping ([NewsData], [ProfilesData]) -> Void) {
        let parameters: Parameters = [
            "access_token": token,
            "count": "50",
            "filters": "photo", /*, wall_photo*/
            "v": protocolVersion
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: parameters).responseData(queue: DispatchQueue.global()) { response in
            guard let data = response.value else {
                completion([], [])
                return
            }
            let json = try! JSON(data: data)
            let news: [NewsData] = json["response"]["items"].array?.map {
                NewsData(json: $0["photos"]["items"].array!.first!)
                } ?? []
            let profiles: [ProfilesData] = json["response"]["profiles"].array?.map {
                ProfilesData(json: $0)
                } ?? []
            // FIXME: add groups
            DispatchQueue.main.async {
                completion(news, profiles)
            }
        }
    }



}
