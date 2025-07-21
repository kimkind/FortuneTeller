// Views/FortuneTellerListView.swift

import SwiftUI

struct FortuneTellerListView: View {
    @Environment(UserData.self) private var userData
    
    private var tellers: [FortuneTeller] {
        DataManager.loadTellers()
    }
    
    var body: some View {
        List {
            ForEach(tellers) { teller in
                HStack {
                    Text(teller.name)
                    Text(teller.specialty)
                    if userData.unlockedTellers.contains(teller.id) {
                        Text("Unlocked")
                    } else {
                        Button("Unlock ($0.99)") {
                            // Simulate unlock
                            userData.unlockedTellers.append(teller.id)
                        }
                    }
                }
            }
        }
        .navigationTitle("Fortune Tellers")
    }
}

#Preview {
    FortuneTellerListView()
        .environment(UserData())
}
