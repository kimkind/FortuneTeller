//
//  Extensions.swift
//  FortuneTeller
//
//  Created by Kimkind Yeung on 19/7/2025.
//

import SwiftUI

extension View {
    // Example extension
    func roundedBorder() -> some View {
        self
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
    }
}
