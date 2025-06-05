//
//  CartViewTests.swift
//  SwiftMartTests
//
//  Created by Bonmyeong Koo - Vendor on 6/4/25.
//

import XCTest
@testable import SwiftMart

@MainActor
final class CartViewTests: XCTestCase {
    func test_calculateCartTotal() throws {
        let cart = CartManager()
        let p1 = Product(id: 1, title: "One", price: 10, description: "", category: "", image: "")
        let p2 = Product(id: 2, title: "Two", price: 20, description: "", category: "", image: "")

        cart.addToCart(product: p1)
        cart.addToCart(product: p2)
        cart.addToCart(product: p2)

        XCTAssertEqual(cart.totalCartPrice, 50.0)
        XCTAssertEqual(cart.formattedCartPrice, "50.00")
    }
}
