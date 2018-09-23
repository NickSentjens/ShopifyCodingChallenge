//
//  TagsListCell.swift
//  ShopifyCodingChallenge
//
//  Created by Nick Sentjens on 2018-09-19.
//  Copyright © 2018 NickSentjens. All rights reserved.
//

import Foundation
import UIKit

class TagsListCell: UITableViewCell {
    let tagLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(red: 150/225,
                                              green: 191/225,
                                              blue: 72/225,
                                              alpha: 1)
        
        contentView.addSubview(tagLabel)
        
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tagLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            tagLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                               constant: 16),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
