//
//  ProductListCell.swift
//  ShopifyCodingChallenge
//
//  Created by Nick Sentjens on 2018-09-19.
//  Copyright © 2018 NickSentjens. All rights reserved.
//

import Foundation
import UIKit

class ProductListCell: UITableViewCell {
    let nameLabel = UILabel()
    let inventoryLabel = UILabel()
    let productImageView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(red: 150/225,
                                              green: 191/225,
                                              blue: 72/225,
                                              alpha: 1)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        inventoryLabel.translatesAutoresizingMaskIntoConstraints = false
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(productImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(inventoryLabel)
        
        NSLayoutConstraint.activate([
            productImageView.widthAnchor.constraint(equalToConstant: 40),
            productImageView.heightAnchor.constraint(equalToConstant: 40),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                      constant: 16),
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                                  constant: 16),
            
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                              constant: 16),
            
            inventoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            inventoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                     constant: -16)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
