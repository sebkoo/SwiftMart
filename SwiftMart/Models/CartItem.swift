//
//  CartItem.swift
//  SwiftMart
//
//  Created by Bonmyeong Koo - Vendor on 6/4/25.
//

import Foundation

struct CartItem: Identifiable, Equatable {
    let id = UUID()
    let product: Product
    var quantity: Int
}

extension CartItem {
    var totalPrice: Double {
        Double(quantity) * product.price
    }

    var formattedTotalPrice: String {
        String(format: "%.2f", totalPrice)
    }
}
