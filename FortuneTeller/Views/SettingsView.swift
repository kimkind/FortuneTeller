//
//  SettingsView.swift
//  FortuneTeller
//
//  Created by Kimkind Yeung on 19/7/2025.
//

import SwiftUI

struct SettingsView: View {
    @Environment(UserData.self) private var userData
    
    var body: some View {
        VStack {
            Button("Refresh Daily Tokens") {
                userData.refreshDailyTokens()
            }
            
            Text("Settings like language, volume, etc. (Placeholder)")
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView()
        .environment(UserData())
}
