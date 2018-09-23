//
//  ProductVariants.swift
//  ShopifyCodingChallenge
//
//  Created by Nick Sentjens on 2018-09-23.
//  Copyright © 2018 NickSentjens. All rights reserved.
//

import Foundation

struct ProductVariants {
    let inventory: Int
    
    init(inventory: Int) {
        self.inventory = inventory
    }
}

extension ProductVariants: Decodable {
    enum ProductVariantsKeys: String, CodingKey {
        case inventory = "inventory_quantity"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ProductVariantsKeys.self)
        let inventory = try container.decode(Int.self, forKey: .inventory)
        self.init(inventory: inventory)
    }
}

