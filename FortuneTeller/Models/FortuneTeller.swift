// Models/FortuneTeller.swift

import Foundation

struct FortuneTeller: Identifiable, Hashable, Codable {
    let id: Int
    let name: String
    let specialty: String
    let isFree: Bool
    let imageName: String
}
