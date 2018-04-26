//
//  NewsViewCell.swift
//  VkGb
//
//  Created by VitaliyFilippov on 24.04.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.
//

import UIKit

class NewsViewCell: UITableViewCell {
    
    // FIXME: Rename to camelcase
    @IBOutlet weak var AuthorName: UILabel!
    @IBOutlet weak var AuthorAvatar: UIImageView!
    @IBOutlet weak var NewsImage: UIImageView!
    @IBOutlet weak var NewsText: UILabel!
    @IBOutlet weak var LikesCount: UILabel!
    @IBOutlet weak var CommentsCount: UILabel!
    @IBOutlet weak var RepostCount: UILabel!
    @IBOutlet weak var ViewsCount: UILabel!
    
    func config(newsData: NewsData) {
        AuthorName.text = String(newsData.source_id)
        NewsText.text = newsData.text
    }
}
