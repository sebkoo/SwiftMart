//
//  CartManagerTests.swift
//  SwiftMartTests
//
//  Created by Bonmyeong Koo - Vendor on 6/4/25.
//

import XCTest
@testable import SwiftMart

@MainActor
final class CartManagerTests: XCTestCase {
    func test_addToCart_increasesQuantity() {
        let cart = CartManager()
        let product = Product(id: 1, title: "Test", price: 10, description: "", category: "", image: "")
        cart.addToCart(product: product)
        cart.addToCart(product: product)
        XCTAssertEqual(cart.items.count, 1)
        XCTAssertEqual(cart.items.first?.quantity, 2)
    }

    func test_clearCart_removesAllItems() {
        let cart = CartManager()
        let product = Product(id: 1, title: "Test", price: 10, description: "", category: "", image: "")
        cart.addToCart(product: product)
        cart.clearCart()
        XCTAssertTrue(cart.items.isEmpty)
    }
}
