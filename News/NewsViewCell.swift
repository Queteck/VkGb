//
//  NewsViewCell.swift
//  VkGb
//
//  Created by VitaliyFilippov on 24.04.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.
//

import UIKit

class NewsViewCell: UITableViewCell {
    
    @IBOutlet weak var authorAvatar: UIImageView! {
        didSet {
            authorAvatar.layer.cornerRadius = authorAvatar.bounds.size.width / 2
        }
    }
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsText: UILabel!
    @IBOutlet weak var likesCount: UILabel!
    @IBOutlet weak var commentsCount: UILabel!
    @IBOutlet weak var repostCount: UILabel!
    @IBOutlet weak var viewsCount: UILabel!
    
    
    func config(newsData: NewsData, profile: ProfilesData) {
        authorName.text = String(profile.author)
        newsText.text = newsData.text
        commentsCount.text = String(newsData.comments)
        repostCount.text = String(newsData.reposts)
        viewsCount.text = String(newsData.views)
        likesCount.text = String(newsData.likes)
        
        DispatchQueue.global().async {
            do {
                let image = try UIImage(data: Data(contentsOf: URL(string:newsData.photo)!))
                let authorImage = try UIImage(data: Data(contentsOf: URL(string:profile.authorPhoto)!))
                DispatchQueue.main.async {
                    self.newsImage.image = image
                    self.authorAvatar.image = authorImage
                }
            } catch {
                print(error)
            }
        }

    }
}
