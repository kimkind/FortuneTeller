// Models/FortuneTeller.swift

import Foundation

struct FortuneTeller: Identifiable, Hashable, Codable {
    let id: Int
    let name: String
    let specialty: String
    let isFree: Bool
    let imageName: String
}

struct FortuneTellerManager {
    private var fortuneTellers: [FortuneTeller] = []

    init() {
        loadFortuneTellers()
    }

    mutating func loadFortuneTellers() {
        guard let url = Bundle.main.url(forResource: "teller", withExtension: "json") else {
            print("Failed to locate teller.json in bundle.")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            fortuneTellers = try decoder.decode([FortuneTeller].self, from: data)
        } catch {
            print("Failed to decode teller.json: \(error.localizedDescription)")
        }
    }

    func getFortuneTellers() -> [FortuneTeller] {
        return fortuneTellers
    }

    func getFortuneTeller(byId id: Int) -> FortuneTeller? {
        return fortuneTellers.first(where: { $0.id == id })
    }
}
