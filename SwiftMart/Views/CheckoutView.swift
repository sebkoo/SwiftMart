//
//  CheckoutView.swift
//  SwiftMart
//
//  Created by Bonmyeong Koo - Vendor on 6/5/25.
//

import SafariServices
import SwiftUI

struct CheckoutView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) { }
}
