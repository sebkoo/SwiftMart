//
//  ProductListViewModelTests.swift
//  SwiftMartTests
//
//  Created by Bonmyeong Koo - Vendor on 6/4/25.
//

import XCTest
@testable import SwiftMart

@MainActor
final class ProductListViewModelTests: XCTestCase {
    func test_fetchProducts_updatesPublishedProducts() async {
        let mockService = MockProductService()
        let viewModel = ProductListViewModel(service: mockService)

        await viewModel.fetchProducts()

        XCTAssertEqual(viewModel.products.count, 2)
    }
}
