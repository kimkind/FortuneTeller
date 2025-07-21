// Views/FortuneTellerMainView.swift

import SwiftUI

struct Message: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}

struct FortuneTellerMainView: View {
    @State private var selectedTeller: FortuneTeller?
    @State private var question: String = ""
    @State private var messages: [Message] = []
    @State private var errorMessage: String = ""
    @Environment(UserData.self) private var userData
    @StateObject private var viewModel = FortuneTellerViewModel()
    
    private var tellers: [FortuneTeller] {
        DataManager.loadTellers()
    }
    
    var body: some View {
        NavigationStack {  // 保持 NavigationStack 做基本導航，但無 toolbar
            ZStack {
                // Background image of the selected teller
                if let teller = selectedTeller {
                    Image(teller.imageName)  // From JSON
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .opacity(0.5)  // Semi-transparent to see chat
                } else {
                    Color.gray
                        .edgesIgnoringSafeArea(.all)
                }
                
                VStack {
                    // Chat history
                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(messages) { message in
                                Text(message.text)
                                    .padding()
                                    .background(message.isUser ? Color.blue : Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .frame(maxWidth: .infinity, alignment: message.isUser ? .trailing : .leading)
                            }
                        }
                    }
                    .padding(.top)
                    
                    if !errorMessage.isEmpty {
                        Text(errorMessage).foregroundStyle(.red).padding()
                    }
                    
                    Text("Tokens left: \(userData.tokens)").padding()
                    
                    // Input area
                    HStack {
                        TextField("Ask your question", text: $question)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Button("Send") {
                            sendQuestion()
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.8))
                }
            }
            .navigationTitle(selectedTeller?.name ?? "Fortune Teller")
            .onAppear {
                // Auto-select the first unlocked teller
                if selectedTeller == nil {
                    selectedTeller = tellers.first(where: { userData.unlockedTellers.contains($0.id) })
                }
            }
            .onChange(of: selectedTeller) { _, _ in
                // Clear messages when changing teller
                messages = []
            }
        }
        .environment(userData)
    }
    
    private func sendQuestion() {
        guard !question.isEmpty else { return }
        guard let teller = selectedTeller else {
            errorMessage = "No teller selected"
            return
        }
        guard userData.deductTokens(for: question) else {
            errorMessage = "Not enough tokens"
            return
        }
        
        // Append user's question
        messages.append(Message(text: question, isUser: true))
        
        // Get fortune
        viewModel.getFortune(for: question, with: teller) { result in
            switch result {
            case .success(let fortune):
                messages.append(Message(text: fortune.response, isUser: false))
                errorMessage = ""
            case .failure(let error):
                errorMessage = error.localizedDescription
            }
        }
        
        question = ""
    }
}

#Preview {
    FortuneTellerMainView()
        .environment(UserData())
}
