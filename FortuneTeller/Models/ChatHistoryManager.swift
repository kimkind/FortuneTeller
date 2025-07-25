// Models/ChatHistoryManager.swift

import Foundation

struct ChatHistory {
    var date: Date
    var question: String
    var response: String
}

class ChatHistoryManager {
    private var chatHistory: [ChatHistory] = []

    // Example Method to add a chat
    func addChatHistory(question: String, response: String) {
        let chat = ChatHistory(date: Date(), question: question, response: response)
        chatHistory.append(chat)
        // Save to preferred storage
    }

    // Example Method to retrieve chats
    func getChatHistory() -> [ChatHistory] {
        // Retrieve from preferred storage
        return chatHistory
    }
}
