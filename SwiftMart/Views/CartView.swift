//
//  CartView.swift
//  SwiftMart
//
//  Created by Bonmyeong Koo - Vendor on 6/4/25.
//

import SwiftUI

struct CartView: View {
    let checkoutService = CheckoutService()
    @State private var checkoutURL: URL?
    @State private var showingSafari = false
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        NavigationView {
            VStack {
                if cartManager.items.isEmpty {
                    Text("🛒 Your cart is empty")
                        .font(.title3)
                        .padding()
                } else {
                    List {
                        ForEach(cartManager.items) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.product.title)
                                        .bold()
                                    Text("Quantity: \(item.quantity)")
                                }
                                Spacer()
                                Text("$\(item.formattedTotalPrice)")
                            }
                        }
                        .onDelete { indexSet in
                            cartManager.removeItems(at: indexSet)
                        }
                    }

                    HStack {
                        Text("Total: ")
                            .font(.headline)
                        Spacer()
                        Text("$\(cartManager.formattedCartPrice)")
                            .bold()
                    }
                    .padding()

                    Button("Proceed to Checkout") {
                        Task {
                            do {
                                checkoutURL = try await checkoutService.createCheckoutSession(cartItems: cartManager.items)
                                showingSafari = true
                            } catch {
                                print("Stripe error: \(error)")
                            }
                        }
                    }
                    .sheet(isPresented: $showingSafari, content: {
                        if let url = checkoutURL {
                            CheckoutView(url: url)
                        }
                    })
                    .buttonStyle(.borderedProminent)
                    .padding(.bottom)
                }
            }
            .navigationTitle("Your Cart")
            .toolbar {
                if !cartManager.items.isEmpty {
                    Button("Clear") {
                        cartManager.clearCart()
                    }
                }
            }
        }
    }
}

#Preview {
    let cartManager = CartManager()
    cartManager.addToCart(product: Product(id: 1,
                                           title: "Preview Product",
                                           price: 49.99,
                                           description: "",
                                           category: "",
                                           image: "")
    )
    return CartView()
        .environmentObject(cartManager)
}
