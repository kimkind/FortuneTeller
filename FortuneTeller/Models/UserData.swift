//
//  UserData.swift
//  FortuneTeller
//
//  Created by Kimkind Yeung on 19/7/2025.
//

import Foundation
import Observation

@Observable
class UserData {
    var tokens: Int = 100  // Initial tokens
    var maxTokens: Int = 200
    var unlockedTellers: [Int] = [0]  // Initial free teller ID 0
    
    // Simulate daily token refresh (for demo, call manually)
    func refreshDailyTokens() {
        tokens = min(tokens + 50, maxTokens)
    }
    
    // Deduct tokens based on question length
    func deductTokens(for question: String) -> Bool {
        let cost = question.count / 10 + 1  // Simple cost calculation
        if tokens >= cost {
            tokens -= cost
            return true
        }
        return false
    }
}
