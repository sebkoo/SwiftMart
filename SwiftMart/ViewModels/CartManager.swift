//
//  CartManager.swift
//  SwiftMart
//
//  Created by Bonmyeong Koo - Vendor on 6/4/25.
//

import Foundation

@MainActor
final class CartManager: ObservableObject {
    @Published private(set) var items: [CartItem] = []

    func addToCart(product: Product) {
        if let index = items.firstIndex(where: { $0.product == product }) {
            items[index].quantity += 1
        } else {
            items.append(CartItem(product: product, quantity: 1))
        }
    }

    func removeItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    func totalItems() -> Int {
        items.reduce(0) { $0 + $1.quantity }
    }

    func clearCart() {
        items.removeAll()
    }
}

extension CartManager {
    var totalCartPrice: Double {
        items.reduce(0) { $0 + $1.totalPrice }
    }

    var formattedCartPrice: String {
        String(format: "%.2f", totalCartPrice)
    }
}
