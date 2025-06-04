//
//  ProductService.swift
//  SwiftMart
//
//  Created by Bonmyeong Koo - Vendor on 6/4/25.
//

import Foundation

final class ProductService {
    func fetchProducts() async throws -> [Product] {
        let url = URL(string: "https://fakestoreapi.com/products")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Product].self, from: data)
    }
}
