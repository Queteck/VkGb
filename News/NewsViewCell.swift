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
    
    
    func config(newsData: NewsData, profile: ProfilesData, queue: OperationQueue) {
        authorName.text = String(profile.author)
        newsText.text = newsData.text
        commentsCount.text = String(newsData.comments)
        repostCount.text = String(newsData.reposts)
        viewsCount.text = String(newsData.views)
        likesCount.text = String(newsData.likes)
        
        loadImageForImageView(url: newsData.photo, imageView: newsImage, queue: queue)
        loadImageForImageView(url: profile.authorPhoto, imageView: authorAvatar, queue: queue)
    }
    
    private func loadImageForImageView(url: String, imageView: UIImageView, queue: OperationQueue) {
        let operation = GetCacheImage(url: url)
        operation.completionBlock = {
            OperationQueue.main.addOperation {
                imageView.image = operation.outputImage
            }
        }
        queue.addOperation(operation)
    }
}
