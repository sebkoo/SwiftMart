//
//  ProductDetailView.swift
//  SwiftMart
//
//  Created by Bonmyeong Koo - Vendor on 6/4/25.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        VStack(spacing: 16) {
            AsyncImage(url: URL(string: product.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 200)

            Text(product.title)
                .bold()
            Text(product.description)
            Text("$\(product.price, specifier: "%.2f")")
                .font(.title)

            Button("Add to Cart") {
                cartManager.addToCart(product: product)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationTitle("Product Detail")
    }
}

#Preview {
    ProductDetailView(
        product: Product(
            id: 1,
            title: "Preview Product",
            price: 99.99,
            description: "This is a preview",
            category: "test",
            image: "https://fakestoreapi.com/img/test.jpg"
        )
    )
    .environmentObject(CartManager())
}
