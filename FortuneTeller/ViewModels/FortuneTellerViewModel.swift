//
//  FortuneTellerViewModel.swift
//  FortuneTeller
//
//  Created by Kimkind Yeung on 19/7/2025.
//

import Foundation

@MainActor
class FortuneTellerViewModel: ObservableObject {
    func getFortune(for question: String, with teller: FortuneTeller, completion: @escaping (Result<Fortune, Error>) -> Void) {
        // Mock OpenAI call
        let response = teller.isFree ? "Good luck! (Basic)" : "Detailed fortune: Great things ahead in \(teller.specialty)."
        let fortune = Fortune(question: question, response: response)
        completion(.success(fortune))
    }
}
