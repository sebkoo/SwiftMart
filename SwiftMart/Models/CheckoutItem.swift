//
//  CheckoutItem.swift
//  SwiftMart
//
//  Created by Bonmyeong Koo - Vendor on 6/5/25.
//

import Foundation

struct CheckoutItem: Codable {
    let name: String
    let quantity: Int
    let price: Int  // in cents

    init(from cartItem: CartItem) {
        self.name = cartItem.product.title
        self.quantity = cartItem.quantity
        self.price = Int(cartItem.product.price * 100)
    }
}
