//
//  ShopView.swift
//  FortuneTeller
//
//  Created by Kimkind Yeung on 19/7/2025.
//

import SwiftUI

struct ShopView: View {
    @Environment(UserData.self) private var userData
    @StateObject private var viewModel = ShopViewModel()
    
    var body: some View {
        VStack {
            Text("Tokens: \(userData.tokens) / \(userData.maxTokens)")
            
            Button("Buy 100 Tokens ($0.99)") {
                // Simulate purchase
                userData.tokens += 100
            }
            
            Button("Increase Max Tokens to 500 ($1.99)") {
                userData.maxTokens = 500
            }
            
            Button("Subscribe Monthly ($4.99/month)") {
                // Simulate subscription
                userData.refreshDailyTokens()  // Extra tokens
            }
        }
        .navigationTitle("Shop")
    }
}

#Preview {
    ShopView()
        .environment(UserData())
}
