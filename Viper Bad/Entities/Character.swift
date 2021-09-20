// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let character = try? newJSONDecoder().decode(Character.self, from: jsonData)

import Foundation

// MARK: - Character
struct Character: Codable {
    let id: Int
    let name, birthday: String
    let occupation: [String]
    let img: String
    let status, nickname: String
    let appearance: [Int]
    let portrayed, category: String

    enum CodingKeys: String, CodingKey {
        case id = "char_id"
        case name, birthday, occupation, img, status, nickname, appearance, portrayed, category
    }
}

extension Character: Equatable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.id == rhs.id
    }
}
