//
//  CheckoutServiceTests.swift
//  SwiftMartTests
//
//  Created by Bonmyeong Koo - Vendor on 6/5/25.
//

import XCTest
@testable import SwiftMart

final class CheckoutServiceTests: XCTestCase {
    func test_checkoutPayloadEncoding() throws {
        let product = Product(id: 1, title: "Test", price: 9.99, description: "", category: "", image: "")
        let cartItem = CartItem(product: product, quantity: 2)
        let item = CheckoutItem(from: cartItem)
        let data = try JSONEncoder().encode([item])
        let decoded = try JSONDecoder().decode([CheckoutItem].self, from: data)

        XCTAssertEqual(decoded.first?.name, "Test")
        XCTAssertEqual(decoded.first?.price, 999)
        XCTAssertEqual(decoded.first?.quantity, 2)
    }
}
