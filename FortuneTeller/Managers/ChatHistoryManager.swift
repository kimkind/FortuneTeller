// Models/ChatHistoryManager.swift

import Foundation

struct ChatHistory {
    var date: Date
    var fortuneTellerId: Int  // Used to identify which Fortune Teller
    var question: String
    var response: String
}

class ChatHistoryManager {
    private var chatHistory: [ChatHistory] = []

    // Method to add a chat with Fortune Teller's ID
    func addChatHistory(fortuneTellerId: Int, question: String, response: String) {
        let chat = ChatHistory(date: Date(), fortuneTellerId: fortuneTellerId, question: question, response: response)
        chatHistory.append(chat)
        // Save to preferred storage
    }

    // Method to retrieve all chat histories
    func getChatHistory() -> [ChatHistory] {
        return chatHistory
    }

    // Method to retrieve chat histories for a specific Fortune Teller
    func getChatHistory(forFortuneTellerId id: Int) -> [ChatHistory] {
        return chatHistory.filter { $0.fortuneTellerId == id }
    }
}
