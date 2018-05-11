//
//  FriendsViewCell.swift
//  VkGb
//
//  Created by VitaliyFilippov on 05.04.2018.
//  Copyright © 2018 VitaliyFilippov. All rights reserved.
//

import UIKit

class FriendsViewCell: UITableViewCell {
    
    let instets: CGFloat = 10.0
    
    @IBOutlet weak var friendsList: FriendsViewCell!{
        didSet {
            friendsList.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    @IBOutlet weak var friendsName: UILabel!{
        didSet {
            friendsName.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    @IBOutlet weak var friendAvatar: UIImageView!{
        didSet {
            friendAvatar.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setFriendsName(text: String) {
        friendsName.text = text
        friendsNameLabelFrame()
    }
    
    func getLabelSize(text: String, font: UIFont) -> CGSize {
        // определяем максимальную ширину текста - это ширина ячейки минус отступы слева и справа
        let maxWidth = bounds.width - instets * 2
        // получаем размеры блока под надпись
        // используем максимальную ширину и максимально возможную высоту
        let textBlock = CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude)
        // получаем прямоугольник под текст в этом блоке и уточняем шрифт
        let rect = text.boundingRect(with: textBlock, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        // получаем ширину блока, переводим ее в Double
        let width = Double(rect.size.width)
        // получаем высоту блока, переводим ее в Double
        let height = Double(rect.size.height)
        // получаем размер, при этом округляем значения до большего целого числа
        let size = CGSize(width: ceil(width), height: ceil(height))
        return size
    }
    
    func friendsNameLabelFrame() {
        // получаем размер текста, передавая сам текст и шрифт
        let friendsNameLabelSize = getLabelSize(text: friendsName.text!, font: friendsName.font)
        // рассчитываем координату по оси Х
        let friendsNameLabelX = (bounds.width - friendsNameLabelSize.width) / 2
        // получаем точку верхнего левого угла надписи
        let friendsNameLabelOrigin = CGPoint(x: friendsNameLabelX, y: instets)
        // получаем фрейм и устанавливаем его UILabel
        friendsName.frame = CGRect(origin: friendsNameLabelOrigin, size: friendsNameLabelSize)
    }
    
    func friendAvatarFrame() {
        let friendAvatarSideLinght: CGFloat = 50
        let friendAvatarSize = CGSize(width: friendAvatarSideLinght, height: friendAvatarSideLinght)
        let friendAvatarOrigin = CGPoint(x: bounds.midX - friendAvatarSideLinght / 2, y: bounds.midY - friendAvatarSideLinght / 2)
        friendAvatar.frame = CGRect(origin: friendAvatarOrigin, size: friendAvatarSize)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        friendAvatarFrame()
        friendsNameLabelFrame()
    }
}
