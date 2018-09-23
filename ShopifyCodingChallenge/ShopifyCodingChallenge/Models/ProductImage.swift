//
//  ProductImage.swift
//  ShopifyCodingChallenge
//
//  Created by Nick Sentjens on 2018-09-23.
//  Copyright © 2018 NickSentjens. All rights reserved.
//

import Foundation

struct ProductImage {
    let imageURL: URL
    
    init(imageURL: URL) {
        self.imageURL = imageURL
    }
}

extension ProductImage: Decodable {
    enum ProductImageKeys: String, CodingKey {
        case imageURL = "src"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ProductImageKeys.self)
        let imageURL = try container.decode(URL.self, forKey: .imageURL)
        self.init(imageURL: imageURL)
    }
}
