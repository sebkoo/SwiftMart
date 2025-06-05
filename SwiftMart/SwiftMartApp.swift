//
//  SwiftMartApp.swift
//  SwiftMart
//
//  Created by Bonmyeong Koo - Vendor on 6/4/25.
//

import SwiftUI

@main
struct SwiftMartApp: App {
    @StateObject var cartManager = CartManager()

    var body: some Scene {
        WindowGroup {
            TabView {
                ProductListView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                CartView()
                    .tabItem {
                        Label("Cart", systemImage: "cart")
                    }
            }
            .environmentObject(cartManager)
        }
    }
}
