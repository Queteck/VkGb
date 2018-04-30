//
//  NewsViewCell.swift
//  VkGb
//
//  Created by VitaliyFilippov on 24.04.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.
//

import UIKit

class NewsViewCell: UITableViewCell {
    
    @IBOutlet weak var authorAvatar: UIImageView!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsText: UILabel!
    @IBOutlet weak var likesCount: UILabel!
    @IBOutlet weak var commentsCount: UILabel!
    @IBOutlet weak var repostCount: UILabel!
    @IBOutlet weak var viewsCount: UILabel!
    
    
    func config(newsData: NewsData) {
        authorName.text = String(newsData.source_id)
        newsText.text = newsData.text
    }
}
