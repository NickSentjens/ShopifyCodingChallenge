//
//  Product.swift
//  ShopifyCodingChallenge
//
//  Created by Nick Sentjens on 2018-09-19.
//  Copyright © 2018 NickSentjens. All rights reserved.
//

import Foundation

struct Product {
    let title: String
    let tags: [String]
    let inventoryQuantity: Int
    let image: ProductImage

    init(title: String, tags: [String], inventoryQuantity: Int, image: ProductImage) {
        self.title = title
        self.tags = tags
        self.inventoryQuantity = inventoryQuantity
        self.image = image
    }
}

extension Product: Decodable {
    enum ProductKeys: String, CodingKey {
        case title = "title"
        case tags = "tags"
        case variants = "variants"
        case image = "image"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ProductKeys.self)
        let title = try container.decode(String.self, forKey: .title)
        
        let tags = try container.decode(String.self, forKey: .tags)
        let seperatedTags = tags.components(separatedBy: ", ")
        
        let variants = try container.decode([ProductVariants].self, forKey: .variants)
        var inventory = 0
        variants.forEach { variant in
            inventory += variant.inventory
        }
        
        let image = try container.decode(ProductImage.self, forKey: .image)
        
        self.init(title: title,
                  tags: seperatedTags,
                  inventoryQuantity: inventory,
                  image: image)
    }
}
