// Managers/DataManager.swift

import Foundation

class DataManager {
    static func loadTellers() -> [FortuneTeller] {
        guard let url = Bundle.main.url(forResource: "tellers", withExtension: "json") else {
            print("tellers.json not found in bundle")
            return []
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let tellers = try decoder.decode([FortuneTeller].self, from: data)
            return tellers
        } catch {
            print("Decode error: \(error)")
            return []
        }
    }
}
