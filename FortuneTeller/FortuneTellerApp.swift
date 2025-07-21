// FortuneTellerApp.swift

import SwiftUI

@main
struct FortuneTellerApp: App {
    @State private var userData = UserData()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                FortuneTellerMainView()
                    .tabItem {
                        Label(String(localized: "Tab1"), systemImage: "wand.and.stars")  // 用你嘅 Tab1 key，取 "Fortune-telling" 或 "占卜" test
                    }
                
                FortuneTellerListView()
                    .tabItem {
                        Label(String(localized: "Tab2"), systemImage: "person.3")  // Tab2: "Tellers" 或 "占卜師"
                    }
                
                ShopView()
                    .tabItem {
                        Label(String(localized: "Tab3"), systemImage: "cart")  // Tab3: "Shop" 或 "商店"
                    }
                
                SettingsView()
                    .tabItem {
                        Label(String(localized: "Tab4"), systemImage: "gear")  // Tab4: "Settings" 或 "設定"
                    }
            }
            .environment(userData)  // 保持分享 UserData
        }
    }
}
