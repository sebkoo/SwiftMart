//
//  CheckoutService.swift
//  SwiftMart
//
//  Created by Bonmyeong Koo - Vendor on 6/5/25.
//

import Foundation

final class CheckoutService {
    func createCheckoutSession(cartItems: [CartItem]) async throws -> URL {
        guard let url = URL(string: "https://your-serverless-backend.com/checkout") else {
            throw URLError(.badURL)
        }

        let checkoutItems = cartItems.map { CheckoutItem(from: $0) }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(checkoutItems)

        let (data, _) = try await URLSession.shared.data(for: request)

        let result = try JSONDecoder().decode([String: String].self, from: data)

        guard let checkoutURLString = result["checkout_url"],
              let checkoutURL = URL(string: checkoutURLString) else {
            throw URLError(.cannotParseResponse)
        }
        
        return checkoutURL
    }
}
