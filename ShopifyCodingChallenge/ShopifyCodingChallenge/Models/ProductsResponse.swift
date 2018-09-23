//
//  ProductsResponse.swift
//  ShopifyCodingChallenge
//
//  Created by Nick Sentjens on 2018-09-23.
//  Copyright © 2018 NickSentjens. All rights reserved.
//

import Foundation

struct ProductsResponse {
    let products: [Product]
    
    init(products: [Product]) {
        self.products = products
    }
}

extension ProductsResponse: Decodable {
    enum ProductsKeys: String, CodingKey {
        case products = "products"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ProductsKeys.self)
        let products = try container.decode([Product].self, forKey: .products)
        self.init(products: products)
    }
}
