//
//  ProductService.swift
//  SwiftMart
//
//  Created by Bonmyeong Koo - Vendor on 6/4/25.
//

import Foundation

protocol ProductServiceProtocol {
    func fetchProducts() async throws -> [Product]
}

final class ProductService: ProductServiceProtocol {
    func fetchProducts() async throws -> [Product] {
        let url = URL(string: "https://fakestoreapi.com/products")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Product].self, from: data)
    }
}

final class MockProductService: ProductServiceProtocol {
    func fetchProducts() async throws -> [Product] {
        return [
            Product(id: 1,
                    title: "Mock Product 1",
                    price: 29.99,
                    description: "Description 1",
                    category: "Mock Category",
                    image: "https://fakestoreapi.com/img/mock1.jpg"),
            Product(id: 2,
                    title: "Mock Product 2",
                    price: 59.99,
                    description: "Description 2",
                    category: "Mock Category",
                    image: "https://fakestoreapi.com/img/mock2.jpg")
        ]
    }
}
