//
//  SwiftMartTests.swift
//  SwiftMartTests
//
//  Created by Bonmyeong Koo - Vendor on 6/4/25.
//

import XCTest
@testable import SwiftMart

final class ProductServiceTest: XCTestCase {
    func test_fetchProducts_returnsProducts() async throws {
        let service = ProductService()
        let products = try await service.fetchProducts()
        XCTAssertFalse(products.isEmpty)
    }
}
