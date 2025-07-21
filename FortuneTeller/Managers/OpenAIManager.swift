//
//  OpenAIManager.swift
//  FortuneTeller
//
//  Created by Kimkind Yeung on 19/7/2025.
//

import Foundation

class OpenAIManager {
    static let shared = OpenAIManager()
    
    private init() {}
    
    func callAPI(with prompt: String, completion: @escaping (Result<String, Error>) -> Void) {
        // Mock for now
        completion(.success("Mock response from LLM"))
    }
}
