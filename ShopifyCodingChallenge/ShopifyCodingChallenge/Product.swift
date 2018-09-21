//
//  Product.swift
//  ShopifyCodingChallenge
//
//  Created by Nick Sentjens on 2018-09-19.
//  Copyright © 2018 NickSentjens. All rights reserved.
//

import Foundation

class Product {
    let availableInventory: Int
    let name: String
    let tags: [String]
    let imageURL: URL
    
    init(availableInventory: Int, name: String, tags: [String], imageURL: URL) {
        self.availableInventory = availableInventory
        self.name = name
        self.tags = tags
        self.imageURL = imageURL
    }
}
